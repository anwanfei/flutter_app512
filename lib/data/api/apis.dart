///接口类
class Apis {
  static const String BASE_HOST = "https://www.wanandroid.com";

  /// 首页轮播
  static const String HOME_BANNER = BASE_HOST + "/banner/json";

  /// 首页列表
  static const String HOME_ARTICLE_LIST = BASE_HOST + "/article/list";

  /// 广场列表
  static const String SQUARE_LIST = BASE_HOST + "/user_article/list";

  /// 获取公众号名称
  static const String WX_CHAPTERS_LIST = BASE_HOST + "/wxarticle/chapters/json";

  /// 公众号文章数据列表
  static const String WX_ARTICLE_LIST = BASE_HOST + "/wxarticle/list";
}
