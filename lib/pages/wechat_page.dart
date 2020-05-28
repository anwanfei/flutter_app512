import 'package:flutter/material.dart';
import 'package:flutterapp512/data/model/wx_chapters_model.dart';

class WechatPage extends StatefulWidget {
  createState() => _WechatPage();
}

class _WechatPage extends State<WechatPage> with TickerProviderStateMixin {
  WXChaptersModel _wxChaptersModel = WXChaptersModel();

  List<Tab> tabs = [
    Tab(
      text: '汽车',
    ),
    Tab(
      text: '要闻',
    )
  ];
  TabController _tabController;

@override
  void initState() {
  super.initState();

  }
  @override
  Widget build(BuildContext context) {
    _tabController = new TabController(length: tabs.length, vsync: this);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.red,
            child: TabBar(
              isScrollable: false,
              indicatorColor: Colors.white,
              tabs: tabs,
              controller: _tabController,
            ),
          ),
          Expanded(
              child: TabBarView(
            children: tabs.map((Tab tab) {
              return Center(child: Text(tab.text));
            }).toList(),
            controller: _tabController,
          ))
        ],
      ),
    );
  }
}
