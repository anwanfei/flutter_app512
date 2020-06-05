import 'package:flutter/material.dart';

class BigflyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BigflyScreen();
  }
}

class _BigflyScreen extends State<BigflyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BigflyScreen"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('点我退出'),
          onPressed: () {
            Navigator.pop(context, "我是来自BigFly界面数据");
          },
        ),
      ),
    );
  }
}
