import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp512/data/api/api_service.dart';
import 'package:flutterapp512/data/model/wx_chapters_model.dart';

class WechatPage extends StatefulWidget {
  createState() => _WechatPage();
}

class _WechatPage extends State<WechatPage> with TickerProviderStateMixin {
  WXChaptersModel _wxChaptersModel = WXChaptersModel();
  TabController _tabController;
  List<Tab> tabs = [
    Tab(
      text: '汽车',
    ),
    Tab(
      text: '要闻',
    )
  ];

  @override
  void initState() {
    super.initState();
    getWXChaptersList();
  }

  getWXChaptersList() async {
    await ApiService().getWXChaptersList().then((value) {
      var data = json.decode(value.toString());
      setState(() {
        _wxChaptersModel = WXChaptersModel.fromJson(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _tabController = new TabController(length: _wxChaptersModel.data.length, vsync: this);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.red,
            child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              tabs: _wxChaptersModel.data.map((WXChaptersBean wxChaptersBean) {
                return Tab(
                  text: wxChaptersBean.name,
                );
              }).toList(),
              controller: _tabController,
            ),
          ),
          Expanded(
              child: TabBarView(
            children: _wxChaptersModel.data.map((WXChaptersBean wxChaptersBean) {
              return Center(child: Text(wxChaptersBean.name));
            }).toList(),
            controller: _tabController,
          ))
        ],
      ),
    );
  }
}
