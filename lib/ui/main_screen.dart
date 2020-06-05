import 'package:flutter/material.dart';
import 'package:flutterapp512/pages/anfly_screen.dart';
import 'package:flutterapp512/pages/home_page.dart';
import 'package:flutterapp512/pages/knowledge_page.dart';
import 'package:flutterapp512/pages/square_page.dart';
import 'package:flutterapp512/pages/wechat_page.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  List<Widget> list = List();
  int _currentIndex = 0;

  @override
  void initState() {
    list
      ..add(HomePage())
      ..add(SquarePage())
      ..add(WechatPage())
      ..add(KnowledgePage())
      ..add(AnflyScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
//        leading: Icon(Icons.android),
        backgroundColor: Colors.red,
        centerTitle: true,
        // 非隐藏的菜单
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.share),
              tooltip: 'Add Alarm',
              onPressed: () {
                print('非隐藏的菜单');
              }),
          // 隐藏的菜单
          new PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              new PopupMenuItem(value: "A", child: new Text("选项一")),
              new PopupMenuItem(value: "B", child: new Text("选项二")),
              new PopupMenuItem(value: "C", child: new Text("选项三"))
            ],
            onSelected: (String action) {
              // 点击选项的时候
              switch (action) {
                case 'A':
                  print("选项二的内容");
                  break;
                case 'B':
                  print("选项二的内容");
                  break;
                case 'C':
                  print("选项三的内容");
                  break;
              }
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: DrawaerScreen(),
      ),
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        //导航文字是否全部显示,shifting为默认值，动画效果，fixed文字全部显示
        fixedColor: Colors.red,
        iconSize: 20.0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text(
                '首页',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.crop_square,
              ),
              title: Text(
                '广场',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.public,
              ),
              title: Text(
                '公众号',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              title: Text(
                '体系',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              title: Text(
                '没事',
              )),
        ],
      ),
    );
  }
}

class DrawaerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //设置用户信息、头像、用户名、Email等
        UserAccountsDrawerHeader(
          accountName: Text("大飞"),
          accountEmail: Text("dafei@163.com"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.jpg'),
          ),
          onDetailsPressed: () {
            print("点击");
          },
          otherAccountsPictures: <Widget>[
            Container(
              child: Text('其他信息'),
            )
          ],
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Colors.red,
          ),
          title: Text('设置'),
        ),
        ListTile(
          leading: Icon(
            Icons.person_add,
            color: Colors.red,
          ),
          title: Text('登录'),
          onTap: () {},
        )
      ],
    );
  }
}
