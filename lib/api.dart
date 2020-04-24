// 网络请求数据
import 'package:http/http.dart' as http;

// key-value 数据持久化
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 文件 数据持久化
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:json_annotation/json_annotation.dart';

import 'package:weibo/model/access_token_model.dart';
// import 'access_token_model.dart';

import 'dart:async';
import 'dart:convert';



class Api {
  // 工厂模式
  factory Api() =>_getInstance();

  static Api get instance => _getInstance();

  static Api _instance;

  AccessToken _accessToken;

  //  这里返回false进行微博授权
  Future<bool> getToken() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String access_token;
    String remind_in;
    String expires_in;
    String uid;
    String isRealName;

    access_token = prefs.getString('access_token') ?? '';

    if (access_token == ''){
      return false;
    }

    remind_in = prefs.getString('remind_in') ?? '';
    expires_in = prefs.getString('expires_in') ?? '';
    uid = prefs.getString('uid') ?? '';
    isRealName = prefs.getString('isRealName') ?? '';

    this._accessToken = AccessToken(access_token,
        remind_in,
        expires_in,uid,isRealName);
    return true;
  }

  Future<AccessToken> getToekn(String code) async {
    var url = 'https://api.weibo.com/oauth2/access_token?client_id=2281156020&client_secret=9ab10c4124b06d26014d111bc0ee39f4&redirect_uri=https://onelcat.github.io/&grant_type=authorization_code&code=';
    url = url + code;
    final response = await http.post(url);
    final parsed = json.decode(response.body);
    var accessToken = AccessToken.fromJson(parsed);
    print("返回的tonken $accessToken");
  }

  Api._internal() {
    // 初始化
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//    final SharedPreferences prefs = _prefs;
//    var access_token = _prefs.getString('access_token');
    // 判断 token数据

  }

  static Api _getInstance() {
    if (_instance == null) {
      _instance = new Api._internal();
    }
    return _instance;
  }


}