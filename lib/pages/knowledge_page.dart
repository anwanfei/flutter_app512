import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class KnowledgePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _KnowledgePage();
  }
}

class _KnowledgePage extends State<KnowledgePage>
    with TickerProviderStateMixin {
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
  Widget build(BuildContext context) {
    _tabController = new TabController(length: tabs.length, vsync: this);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            child: TabBar(tabs: tabs),
          ),
          TabBarView(
            children: <Widget>[

            ],
          )
        ],
      ),
    );
  }
}
