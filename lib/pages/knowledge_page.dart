import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterapp512/ui/knowlwdge_tree_screen.dart';
import 'package:flutterapp512/ui/navigation_screen.dart';

class KnowledgePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KnowledgePage();
  }
}

class _KnowledgePage extends State<KnowledgePage>
    with TickerProviderStateMixin {
  TabController _tabController;
  List<Tab> tabs = [
    Tab(
      text: '体系',
    ),
    Tab(
      text: '导航',
    ),
  ];

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
            children: <Widget>[
              KnowledgeTreeScreen(),
              NavigationScreen(),
            ],
            controller: _tabController,
          ))
        ],
      ),
    );
  }
}
