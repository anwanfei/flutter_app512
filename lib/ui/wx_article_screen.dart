import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp512/data/api/api_service.dart';
import 'package:flutterapp512/data/model/article_model.dart';
import 'package:flutterapp512/data/model/wx_article_model.dart';
import 'package:flutterapp512/ui/item_article_list.dart';
import 'package:flutterapp512/ui/item_wx_article_list.dart';

class WXArticleScreen extends StatefulWidget {
  int id;

  WXArticleScreen(this.id);

  @override
  State<StatefulWidget> createState() {
    return _WXArticleScreen();
  }
}

class _WXArticleScreen extends State<WXArticleScreen> {
  WXArticleModel _wxArticleModel = WXArticleModel();
  ScrollController _scrollController = ScrollController();
  int _page = 0;

  @override
  void initState() {
    super.initState();
    getWXArticleList();
  }

  getWXArticleList() async {
    int _id = widget.id;
    await ApiService().getWXArticleList(_id, _page).then((value) {
      var data = json.decode(value.toString());
      setState(() {
        _wxArticleModel = WXArticleModel.fromJson(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_wxArticleModel.data == null) return loadingWidget();
    return ListView.builder(
      itemBuilder: itemview,
      itemCount: _wxArticleModel.data.datas.length,
      controller: _scrollController,
    );
  }

  Widget itemview(BuildContext context, int index) {
    WXArticleBean articleBean = _wxArticleModel.data.datas[index];
    return ItemWxArticleList(articleBean);
  }
}

Widget loadingWidget() {
  return Center(
    child: CircularProgressIndicator(
      strokeWidth: 2.0,
    ),
  );
}
