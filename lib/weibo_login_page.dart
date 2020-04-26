import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:weibo/api.dart';



class WeiboLoginPage extends StatefulWidget {

  @override
  _WeiboLoginPage createState() => _WeiboLoginPage();
}

class _WeiboLoginPage extends State<WeiboLoginPage> {
  @override
  Widget build(BuildContext context) {
    final flutterWebviewPlugin = new FlutterWebviewPlugin();

    var url = WeiBoApi.instance.getAuthorizeURL();

    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      var isLogin = WeiBoApi.instance.login(url);
      isLogin.then((value) {
        if (value) {
          print("返回上一层界面首，获取用户数据");
        } else {

        }
      });
    });

    return WebviewScaffold(
        url: url,
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("微博授权登陆"),
        ));
  }
}
