import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp512/data/api/api_service.dart';
import 'package:flutterapp512/data/model/navigation_model.dart';
import 'package:flutterapp512/utils/loadind_util.dart';

class NavigationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavigationScreen();
  }
}

class _NavigationScreen extends State<NavigationScreen> {
  NavigationModel _navigationModel = NavigationModel();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getNavigationList();
  }

  getNavigationList() async {
    await ApiService().getNavigationList().then((value) {
      var data = json.decode(value.toString());
      setState(() {
        _navigationModel = NavigationModel.fromJson(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_navigationModel.data == null) return LoadingUtil.loading();
    return ListView.builder(
      itemBuilder: itemView,
      controller: _scrollController,
      itemCount: _navigationModel.data.length,
    );
  }

  Widget itemView(BuildContext context, int index) {
    var navigationBean = _navigationModel.data[index];
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              navigationBean.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            alignment: Alignment.centerLeft,
            child: itemChildView(navigationBean.articles),
          ),
          Container(
            child: Divider(
              height: 1,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Widget itemChildView(List<NavigationArticleBean> children) {
    List<Widget> tiles = [];
    Widget content;
    for (var item in children) {
      tiles.add(
        new InkWell(
          onTap: () {},
          child: Chip(
            backgroundColor: Colors.lightBlueAccent,
            label: Text(
              item.title,
              style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic),
            ),
            labelPadding: EdgeInsets.only(left: 3.0, right: 3.0),
            // backgroundColor: Color(0xfff1f1f1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      );
    }

    content =
        Wrap(spacing: 10, alignment: WrapAlignment.start, children: tiles);
    return content;
  }
}
