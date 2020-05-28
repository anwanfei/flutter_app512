import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp512/ui/webview_screen.dart';

/// 路由工具类
class RouteUtil {
  /// 跳转页面
  static void push(BuildContext context, Widget page) async {
    if (context == null || page == null) return;
    await Navigator.push(
        context, new CupertinoPageRoute<void>(builder: (context) => page));
  }

  /// 跳转到 WebView 打开
  static void toWebView(BuildContext context, String title, String url) async {
    if (context == null || url.isEmpty) return;
    await Navigator.of(context)
        .push(new CupertinoPageRoute<void>(builder: (context) {
      return new WebViewScreen(
        title: title,
        url: url,
      );
    }));
  }
}
