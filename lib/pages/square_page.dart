import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp512/data/api/api_service.dart';
import 'package:flutterapp512/data/model/article_model.dart';

class SquarePage extends StatefulWidget {
  createState() => _SquarePage();
}

class _SquarePage extends State<SquarePage> {
  ScrollController _scrollController = ScrollController();
  ArticleModel _articleModel = ArticleModel();
  int _page = 0;

  @override
  void initState() {
    super.initState();
    getArticleList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: itemView,
      itemCount: _articleModel.data.datas.length,
      controller: _scrollController,
    );
  }

  Widget itemView(BuildContext context, int inext) {
    ArticleBean articleBean = _articleModel.data.datas[inext];
    return ItemSquareScreen(articleBean);
  }

  void getArticleList() async {
    await ApiService().getSquareList(_page).then((value) {
      var data = json.decode(value.toString());
      setState(() {
        _articleModel = ArticleModel.fromJson(data);
      });
    });
  }
}

class ItemSquareScreen extends StatefulWidget {
  ArticleBean item;

  ItemSquareScreen(this.item);

  @override
  State<StatefulWidget> createState() {
    return _ItemSquareScreen();
  }
}

class _ItemSquareScreen extends State<ItemSquareScreen> {
  @override
  Widget build(BuildContext context) {
    var item = widget.item;
    return Card(
      child: InkWell(
        onTap: () {},
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: Row(
                children: <Widget>[
                  Text(
                    item.author.isEmpty ? item.shareUser : item.author,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Expanded(
                      child: Text(
                    item.niceShareDate,
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 16),
              child: Text(
                item.title,
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
              child: Row(
                children: <Widget>[
                  Text(
                    item.superChapterName + "/" + item.chapterName,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Expanded(
                    child: Container(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          item.collect ? Icons.favorite : Icons.favorite_border,
                          size: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
