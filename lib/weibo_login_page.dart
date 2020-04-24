import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const kAndroidUserAgent =
    'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

const redirect_uri='https://onelcat.github.io/';

class WeiboLoginPage extends StatefulWidget {

  @override
  _WeiboLoginPage createState() => _WeiboLoginPage();
}

class _WeiboLoginPage extends State<WeiboLoginPage> {
  @override
  Widget build(BuildContext context) {
    final flutterWebviewPlugin = new FlutterWebviewPlugin();

    const url =
        'https://api.weibo.com/oauth2/authorize?client_id=2281156020&redirect_uri=https://onelcat.github.io/';

    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      print('url call back $url');
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
