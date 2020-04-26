// 网络请求数据
import 'package:http/http.dart' as http;

// key-value 数据持久化
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 文件 数据持久化
import 'dart:async';


import 'package:weibo/model/access_token_model.dart';
import 'package:weibo/model/statuses_result_model.dart';
import 'package:weibo/model/pic_url_model.dart';
import 'dart:convert';




const client_id = '900916882';
const client_secret = '8d21b1ff16a055ddc092eac3b9ff5b65';
const kAndroidUserAgent =
    'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';
const redirect_uri='https://onelcat.github.io/2020/04/25/WeiboAuthorize/';




class WeiBoApi {

  String getAuthorizeURL() {
    return 'https://api.weibo.com/oauth2/authorize?client_id=$client_id&redirect_uri=$redirect_uri';
  }

  Future<bool> login(String url) async {
    var code = _getTokenCode(url);
    if (code == '' ) {
      return false;
    }
    var token = await _getToken(code);
    if (token.access_token.length > 0) {
      this._setToken(token);
      this.isLogin = true;
      return true;
    }
    this.isLogin = false;
    return false;
  }

  String _getTokenCode(String url) {
    const pi = '$redirect_uri?code=';
    var code = '';
    if (url.startsWith(pi)) {
      code = url.replaceAll(pi, '');
      login(code);
    }
    return code;
  }

  // 工厂模式
  factory WeiBoApi() =>_getInstance();

  static WeiBoApi get instance => _getInstance();

  static WeiBoApi _instance;

  var isLogin = false;

  AccessToken _accessToken;

  static String _getPicUrl(String thumbnail_pic,EnumPicUrl resultType) {

    switch (resultType) {
      case EnumPicUrl.thumbnail_pic:
        return thumbnail_pic;
      case EnumPicUrl.bmiddle_pic:
        return thumbnail_pic.replaceFirst("thumbnail", "bmiddle");
      case EnumPicUrl.original_pic:
        return thumbnail_pic.replaceFirst("thumbnail", "large");
        break;
    }
    return thumbnail_pic;
  }

  static String getPicUrl(String thumbnail_pic,EnumPicUrl type) {
    return _getPicUrl(thumbnail_pic,type);
  }

  Future<bool> _setToken(AccessToken token) async {
    this._accessToken = token;
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setString("access_token", token.access_token);
    prefs.setString("remind_in", token.remind_in);
    prefs.setInt("expires_in", token.expires_in);
    prefs.setString("uid", token.uid);
    prefs.setString("isRealName", token.isRealName);
    return true;

  }

  Future<bool> getToken() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String access_token;
    String remind_in;
    int expires_in;
    String uid;
    String isRealName;

    access_token = prefs.getString('access_token') ?? '';

    if (access_token == ''){
      this.isLogin = false;
      return false;
    }
    this.isLogin = true;
    remind_in = prefs.getString('remind_in') ?? '';
    expires_in = prefs.getInt('expires_in') ?? 0;
    uid = prefs.getString('uid') ?? '';
    isRealName = prefs.getString('isRealName') ?? "";

    this._accessToken = AccessToken(access_token,
        remind_in,
        expires_in,uid,isRealName);

    return true;
  }

  Future<AccessToken> _getToken(String code) async {
    var url = 'https://api.weibo.com/oauth2/access_token?client_id=$client_id&client_secret=$client_secret&redirect_uri=$redirect_uri&grant_type=authorization_code&code=$code';
    final response = await http.post(url);
    final parsed = json.decode(response.body);
    var accessToken = AccessToken.fromJson(parsed);
    return accessToken;
  }


  Future<StatusesResult> getStatusesHomeTimeline(void Function(StatusesResult data) resultCallBack) async {
    var url = 'https://api.weibo.com/2/statuses/home_timeline.json?access_token=${this._accessToken.access_token}';
    print("进行请求数据$url");
    final response = await http.get(url);
    final parsed = json.decode(response.body);
    print("微博数据${response.body}");
    var result = StatusesResult.fromJson(parsed);
    print("解析返回的对象${result.statuses.length}");
    resultCallBack(result);
    return result;
  }

  WeiBoApi._internal() {
    // 初始化

    // 先获取会话消息
    getToken();
  }

  static WeiBoApi _getInstance() {
    if (_instance == null) {
      _instance = new WeiBoApi._internal();
    }
    return _instance;
  }


}