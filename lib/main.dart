import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:weibo/api.dart';


import 'package:weibo/weibo_login_page.dart';

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
  Widget buildListItem(BuildContext context, int index) {
    var userName = Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Text("我是谁"), Text("这是日期")],
      ),
    );

    var netImage = Image.network(
        "https://c-ssl.duitang.com/uploads/item/201707/21/20170721180225_NvVJc.jpeg");
    const assetImage = Image(image: AssetImage('images/avatar.jpg'));
    var userAvatar = Container(
      width: 50,
      height: 50,
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(25)), child: netImage),
    );

    var userWidget = Padding(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
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
    var text_str = "我是开的是的饿字符串三大空间的哈开始大渡卡上的卡上卡上的卡技术的卡刷卡是的卡";
    for (var i = 0; i < (index + 1); i = i + 1) {
      text_str = text_str + "$i" + "我需要增量更新这些";
    }

    var text = Padding(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Text(text_str),
    );

    var imagesWidget = GridView.builder(
        itemCount: 3,
        //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
            crossAxisCount: 3,
            //纵轴间距
            mainAxisSpacing: 20.0,
            //横轴间距
            crossAxisSpacing: 10.0,
            //子组件宽高长度比例
            childAspectRatio: 1.0),
        itemBuilder: (BuildContext context, int index) {
          //Widget Function(BuildContext context, int index)
          return Image(image: AssetImage('images/avatar.jpg'));
        });

    var commentWidget = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("转发2007"),
        Text("评论1111"),
        Text("点赞2222"),
      ],
    );

    var myContext = Container(
      color: Colors.red,
      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Column(
        children: <Widget>[
          userWidget,
          text,
          // imagesWidget,
          commentWidget
        ],
      ),
    );

    return myContext;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    var token = Api.instance.getToken();
    token.then((value){
      print("异步返回数据 $value");
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WeiboLoginPage();
      }));
    });
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.builder(
          // padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return buildListItem(context, index);
          }),
    );
  }
}
