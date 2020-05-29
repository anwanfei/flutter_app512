import 'package:flutter/material.dart';
import 'package:flutterapp512/data/model/article_model.dart';
import 'package:flutterapp512/data/model/wx_article_model.dart';
import 'package:flutterapp512/utils/route_util.dart';

class ItemWxArticleList extends StatefulWidget {
  WXArticleBean item;

  ItemWxArticleList(this.item);

  @override
  State<StatefulWidget> createState() {
    return new ItemWxArticleListState();
  }
}

class ItemWxArticleListState extends State<ItemWxArticleList> {
  @override
  Widget build(BuildContext context) {
    var item = widget.item;
    return InkWell(
      onTap: () {
        RouteUtil.toWebView(context, item.title, item.link);
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              children: <Widget>[
                Text(
                  item.author.isNotEmpty ? item.author : item.shareUser,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.left,
                ),
                Expanded(
                    child: Text(
                  item.niceDate,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  textAlign: TextAlign.right,
                ))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: Text(item.title),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: Row(
              children: <Widget>[
                Text(
                  item.superChapterName + "/" + item.chapterName,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Expanded(
                  child: Container(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        item.collect ? Icons.favorite : Icons.favorite_border,
                        size: 14,
                        color: item.collect ? Colors.red : Colors.grey,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
          )
        ],
      ),
    );
  }
}
