import 'package:flutter/material.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewScreen extends StatefulWidget {
  var title;
  var url;

  WebViewScreen({this.title, this.url});

  @override
  State<StatefulWidget> createState() {
    return _WebViewScreen();
  }
}

class _WebViewScreen extends State<WebViewScreen> {
  @override
  Widget build(BuildContext context) {
    var title = widget.title;
    var url = widget.url;
//    return WebviewScaffold(
//      url: url,
//      appBar: AppBar(
//        title: title,
//      ),
//    );
  return Text(title);
  }
}
