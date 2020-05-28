import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = "自定义Theme";
    return MaterialApp(
      title: appName,
      //主题配置
      theme: ThemeData(
        //app整体的主题的亮度
        brightness: Brightness.light,
        //app主要部分的背景色
        primaryColor: Colors.green,
        //app前景色(text,button)
        accentColor: Colors.red[900],
      ),
      home: MyHomePage(
        title: appName,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String title;

  //接收title,可以为widget的唯一标识
  MyHomePage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          //直接获取app 的 accentColor
          //color: Theme.of(context).accentColor,
          child: Text(
            "带颜色的文本内容",
            //获取主题的文本样式
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      floatingActionButton: Theme(
        //使用copyWith获取了 accentColor 后面的颜色可以给null,因为给了也改变不了最上面主题的颜色
        data: Theme.of(context).copyWith(accentColor:Colors.red),
        //data: Theme.of(context).copyWith(accentColor:null),
        //创建特有的主题样式,直接指定颜色
        //data: ThemeData(accentColor: Colors.yellow),
        child: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.computer),
        ),
      ),
    );
  }
}
