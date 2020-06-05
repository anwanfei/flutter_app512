import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp512/data/api/api_service.dart';
import 'package:flutterapp512/data/model/article_model.dart';
import 'package:flutterapp512/utils/loadind_util.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SquarePage extends StatefulWidget {
  createState() => _SquarePage();
}

class _SquarePage extends State<SquarePage> {
  ScrollController _scrollController = ScrollController();

//  ArticleModel _articleModel = ArticleModel();
  List<ArticleBean> _articles = new List();

  int _page = 0;
  RefreshController _refreshController =
      new RefreshController(initialRefresh: false);

  getMoreSquareList() async {
    _page++;
    await ApiService().getSquareList(_page).then((value) {
      var data = json.decode(value.toString());
      _refreshController.loadComplete();
      setState(() {
        ArticleModel _articleModel = ArticleModel.fromJson(data);
        _articles.addAll(_articleModel.data.datas);
      });
    });
  }

  void getArticleList() async {
    _page = 0;
    await ApiService().getSquareList(_page).then((value) {
      var data = json.decode(value.toString());
      _refreshController.refreshCompleted();
      setState(() {
        ArticleModel _articleModel = ArticleModel.fromJson(data);
        _articles = _articleModel.data.datas;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getArticleList();
  }

  @override
  Widget build(BuildContext context) {
    if (_articles.length <= 0) return LoadingUtil.loading();
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: MaterialClassicHeader(),
      footer: RefreshFooter(),
      controller: _refreshController,
      onRefresh: getArticleList,
      onLoading: getMoreSquareList,
      child: ListView.builder(
        itemBuilder: itemView,
        itemCount: _articles.length,
        controller: _scrollController,
      ),
    );
  }

  Widget itemView(BuildContext context, int inext) {
    ArticleBean articleBean = _articles[inext];
    return ItemSquareScreen(articleBean);
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

/// 自定义 FooterView
class RefreshFooter extends CustomFooter {
  @override
  double get height => 40;

  @override
  FooterBuilder get builder => (context, mode) {
        Widget body;
        if (mode == LoadStatus.idle) {
          body = Text("上拉加载更多~");
        } else if (mode == LoadStatus.loading) {
          body = Wrap(
            spacing: 6,
            children: <Widget>[
              CupertinoActivityIndicator(),
              Text("加载中..."),
            ],
          );
        } else if (mode == LoadStatus.failed) {
          body = Text("加载失败，点击重试~");
        } else {
          body = Text("没有更多数据了~");
        }
        return Container(
          height: 40,
          child: Center(child: body),
        );
      };
}
