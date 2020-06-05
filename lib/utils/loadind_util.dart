import 'package:flutter/material.dart';
import 'package:flutterapp512/pages/home_page.dart';

class LoadingUtil {
  static Widget loading() {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
      ),
    );
  }
}
