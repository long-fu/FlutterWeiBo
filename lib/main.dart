import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:weibo/api.dart';
import 'package:weibo/model/pic_url_model.dart';
import 'package:weibo/weibo_login_page.dart';
import 'package:weibo/model/status_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeiBo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'WeiBo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _isLogin = true;

  List<Status> _dataSources = [];

  ScrollController _controller = new ScrollController();

//  Widget getPickView(BuildContext context, int index) {
//    var item = _dataSources[index];
//
//  }

  Widget buildPicUrls(BuildContext context, int index) {
    // 进如到这里默认存在数据
    var item = _dataSources[index];
    var pickUrls = item.pic_urls;
    var imageCount = pickUrls.length;

    if (imageCount == 1) {
      var url = item.pic_urls[0].thumbnail_pic;
      url = WeiBoApi.getPicUrl(url, EnumPicUrl.bmiddle_pic);
      var img = CachedNetworkImage(
        imageUrl: url,
      );

      return Container(
        alignment: Alignment.centerLeft,
        width: _sw,
        height: _sw / 3,
        padding: EdgeInsets.all(10),
        child: img,
      );
    }

    if (imageCount == 2) {
      var height = _sw / 2;
      return Container(
        color: Colors.black,
        width: _sw,
        height: height,
        padding: EdgeInsets.all(10),
        child: GridView.builder(
            itemCount: 2,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: imageCount,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 1.0),
            itemBuilder: (BuildContext context, int index) {
              var url = item.pic_urls[index].thumbnail_pic;
              url = WeiBoApi.getPicUrl(url, EnumPicUrl.bmiddle_pic);
              var img = CachedNetworkImage(
                imageUrl: url,
              );
              return img;
            }),
      );
    }

    if (imageCount == 3) {
      var height = _sw / 3;
      return Container(
        color: Colors.black,
        width: _sw,
        height: height,
        padding: EdgeInsets.all(10),
        child: GridView.builder(
            itemCount: imageCount,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 1.0),
            itemBuilder: (BuildContext context, int index) {
              var url = item.pic_urls[index].thumbnail_pic;
              url = WeiBoApi.getPicUrl(url, EnumPicUrl.bmiddle_pic);
              var img = CachedNetworkImage(
                imageUrl: url,
              );
              return img;
            }),
      );
    }

    if (imageCount == 4) {
      var itemHeight = _sw / 2;
      var height = 2 * itemHeight;

      return Container(
        color: Colors.black,
        width: _sw,
        height: height,
        padding: EdgeInsets.all(10),
        child: GridView.builder(
            itemCount: imageCount,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 1.0),
            itemBuilder: (BuildContext context, int index) {
              var url = item.pic_urls[index].thumbnail_pic;
              url = WeiBoApi.getPicUrl(url, EnumPicUrl.bmiddle_pic);
              var img = CachedNetworkImage(
                imageUrl: url,
              );
              return img;
            }),
      );
    }

    return Container(
      color: Colors.black,
      width: _sw,
      height: _sw,
      padding: EdgeInsets.all(10),
      child: GridView.builder(
          itemCount: imageCount,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              childAspectRatio: 1.0),
          itemBuilder: (BuildContext context, int index) {
            var url = item.pic_urls[index].thumbnail_pic;
            url = WeiBoApi.getPicUrl(url, EnumPicUrl.bmiddle_pic);
            var img = CachedNetworkImage(
              imageUrl: url,
            );
            return img;
          }),
    );
  }

  Widget buildListItem(BuildContext context, int index) {
    var item = _dataSources[index];
    var abiaoqian = RegExp(r'<a.*?>(.*?)<\/a>');
    var sourceStr = '';
    if (item.source.length > 0) {
      var source = abiaoqian.firstMatch(item.source);
      sourceStr = source.group(1);
    }

    var userName = Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(item.user.screen_name),
          Text(sourceStr),
        ],
      ),
    );

    const assetImage = Image(image: AssetImage('images/avatar.jpg'));
    var netImage = CachedNetworkImage(
      imageUrl: item.user.avatar_large,
      placeholder: (context, url) => assetImage,
      errorWidget: (context, url, error) => Image.asset("images/app.png"),
    );

    var userAvatar = Container(
      width: 50,
      height: 50,
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(25)), child: netImage),
    );

    var userWidget = Padding(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Row(
        children: <Widget>[
          userAvatar,
          userName,
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text("下啦"),
          ),
        ],
      ),
    );
    var text_str = item.text;

    var text = Container(
      color: Colors.yellow,
      width: double.infinity,
      margin: EdgeInsets.all(8),
      child: Text(
        text_str,
        textAlign: TextAlign.start,
      ),
    );

//    print("需要渲染的${item.pic_urls}");

    var imageCount = item.pic_urls == null ? 0 : item.pic_urls.length;

    Widget imagesWidget;
    if (imageCount > 0) {
      imagesWidget = buildPicUrls(context, index);
    }

    var commentWidget = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("转发${item.reposts_count}"),
        Text("评论${item.comments_count}"),
        Text("点赞${item.attitudes_count}"),
      ],
    );

    var cw = Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: commentWidget,
    );

    if (imageCount > 0) {
      return Container(
        color: Colors.red,
        margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Column(
          children: <Widget>[userWidget, text, imagesWidget, cw],
        ),
      );
    } else {
      return Container(
        color: Colors.red,
        margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Column(
          children: <Widget>[userWidget, text, cw],
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //给_controller添加监听
    _controller.addListener(() {
      //判断是否滑动到了页面的最底部
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        //如果不是最后一页数据，则生成新的数据添加到list里面
        var result = WeiBoApi.instance.getUpLoadingStatuses((result) {});
        result.then((value) {
          setState(() {
            _dataSources = _dataSources + value.statuses;
          });
        });
      }
    });

    // 调用一次
    var token = WeiBoApi.instance.getToken();
    print("object $token");
    token.then((isLogin) {

      if (isLogin) {
        print("需要进行数据加载");
        var result = WeiBoApi.instance.getDownRefreshStatuses((result){});
        result.then((value) {
          setState(() {

            _dataSources = _dataSources + value.statuses;
            _isLogin = isLogin;
          });
        });
      } else {
        setState(() {
          _isLogin = false;
        });
      }
    });
  }

  double _sw = 0;
  double _sh = 0;

  @override
  Widget build(BuildContext context) {
    var scSize = MediaQuery.of(context).size;

    this._sw = scSize.width;
    this._sh = scSize.height;

    print("绘制屏幕 $scSize");

    Widget title() {
      if (WeiBoApi.instance.isLogin || this._isLogin) {
        return Text("微博");
      } else {
        return ButtonBar(
          children: <Widget>[
            InkWell(
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WeiboLoginPage();
                }))
              },
              child: Text("登录"),
            )
          ],
        );
      }
    }

    Future<Null> _onRefresh() async {
      print("下啦刷新数据");
      var statuses = WeiBoApi.instance.getDownRefreshStatuses((resultData) {});
      var that = this;
      statuses.then((value) {
        var list = value.statuses;
        setState(() {
          that._dataSources = list;
        });
      });
    }

    Widget myBody() {
      return RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
            controller: _controller,
            // padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            itemCount: _dataSources.length,
            itemBuilder: (BuildContext context, int index) {
              return buildListItem(context, index);
            }),
      );
    }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: title(),
      ),
      body: myBody(),
    );
  }
}
