import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutterapp512/data/api/apis.dart';

///dio 方法封装
class ApiService {
  Dio dio = Dio();

  ///  获取首页轮播数据
  Future getBannerList() async {
    try {
      Response response = await dio.get(Apis.HOME_BANNER);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('网络异常！');
      }
    } catch (e) {
      return print(e);
    }
  }

  /// 获取首页文章列表数据
  Future getArticleList(int _page) async {
    try {
      Response response =
          await dio.get(Apis.HOME_ARTICLE_LIST + "/$_page/json");
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('网络异常！');
      }
    } catch (e) {
      print(e);
    }
  }

  ///获取广场数据
  Future getSquareList(int _page) async {
    try {
      Response response = await dio.get(Apis.SQUARE_LIST + "/$_page/json");
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('网络异常');
      }
    } catch (e) {
      print(e);
    }
  }

  ///获取公众号名称
  Future getWXChaptersList() async {
    try {
      Response response = await dio.get(Apis.WX_CHAPTERS_LIST);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('网络异常');
      }
    } catch (e) {
      print(e);
    }
  }

  ///获取公众号文章列表数据
  getWXArticleList(int id, int page) async {
    try {
      Response response =
          await dio.get(Apis.WX_ARTICLE_LIST + "/$id/$page/json");
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('网络异常');
      }
    } catch (e) {
      print(e);
    }
  }
}
