import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterapp512/data/model/article_model.dart';
import 'package:flutterapp512/data/model/banner_model.dart';
import 'package:flutterapp512/data/api/api_service.dart';
import 'package:flutterapp512/ui/item_article_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomePage> {
  int _page = 0;
  BannerModel banners = BannerModel();
  ArticleModel _articleModel = ArticleModel();
  var scrollController = ScrollController();

  List<String> imgs = [
    "http://ww4.sinaimg.cn/large/7a8aed7bjw1exp4h479xfj20hs0qoq6t.jpg",
    "http://ww4.sinaimg.cn/large/7a8aed7bjw1exp4h479xfj20hs0qoq6t.jpg",
    "http://ww4.sinaimg.cn/large/7a8aed7bjw1exp4h479xfj20hs0qoq6t.jpg"
  ];

  @override
  void initState() {
    super.initState();
    getBanners();
    getArticleList();
  }

  void getBanners() async {
    await ApiService().getBannerList().then((value) {
      //解码返回数据
      var data = json.decode(value.toString());
      //设置新数据，刷新状态
      setState(() {
        banners = BannerModel.fromJson(data);
      });
    });
  }

  void getArticleList() async {
    await ApiService().getArticleList(_page).then((value) {
      //解码返回数据
      var data = json.decode(value.toString());
      //设置新数据，刷新状态
      setState(() {
        _articleModel = ArticleModel.fromJson(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: itemView,
        controller: scrollController,
        itemCount: _articleModel.data.datas.length + 1,
      ),
    );
  }

  Widget itemView(BuildContext context, int index) {
    if (index == 0) {
      return Container(
          width: double.infinity,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Swiper(
              itemBuilder: (BuildContext contxt, int index) {
                return Image.network(banners.data[index].imagePath,
                    fit: BoxFit.cover);
              },
              itemCount: banners.data.length,
              pagination: SwiperPagination(),
              //显示indicator
//                control: SwiperControl(), //显示箭头
              loop: true,
              autoplay: true,
            ),
          ));
    }
    ArticleBean item = _articleModel.data.datas[index - 1];
    return ItemArticleList(item: item);
  }
}
