import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp512/data/api/api_service.dart';
import 'package:flutterapp512/data/model/knowledge_tree_model.dart';

class KnowledgeTreeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KnowledgeTreeScreen();
  }
}

class _KnowledgeTreeScreen extends State<KnowledgeTreeScreen> {
  KnowledgeTreeModel _knowledgeTreeModel = KnowledgeTreeModel();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getKnowledgeTreeData();
  }

  getKnowledgeTreeData() async {
    await ApiService().getKnowledgeTreeData().then((value) {
      var data = json.decode(value.toString());
      setState(() {
        _knowledgeTreeModel = KnowledgeTreeModel.fromJson(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: itemView,
      controller: _scrollController,
      itemCount: _knowledgeTreeModel.data.length,
    );
  }

  Widget itemView(BuildContext context, int index) {
    var knowledgeTreeBean = _knowledgeTreeModel.data[index];
    return InkWell(
      onTap: () {
        print('点击事件');
      },
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          knowledgeTreeBean.name,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
                        alignment: Alignment.centerLeft,
                        child: itemChildenView(knowledgeTreeBean.children),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                  size: 16,
                ),
              )
            ],
          ),
          Divider(
            height: 1,
          )
        ],
      ),
    );
  }

  Widget itemChildenView(List<KnowledgeTreeChildBean> children) {
    List<Widget> list = [];
    for (var child in children) {
      list.add(Text(
        child.name,
        style: TextStyle(color: Colors.grey, fontSize: 10),
      ));
    }
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 10,
      runSpacing: 16,
      children: list,
    );
  }
}
