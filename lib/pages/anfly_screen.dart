import 'package:flutter/material.dart';
import 'package:flutterapp512/ui/bigfly_screen.dart';

class AnflyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnflyScreen();
  }
}

class _AnflyScreen extends State<AnflyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            _navigationToBigflyScreen(context);
          },
          child: Text('跳转到Bigfly界面'),
        ),
      ),
    );
  }

  //跳转到第二个界面，必须声明为一个异步方法，因为我们要等待接收返回的数据
  void _navigationToBigflyScreen(BuildContext context) async {
    //压栈操作并等待返回数九
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => BigflyScreen()));
    //读取并显示返回值
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$result'),
    ));
  }
}

