import 'package:book_ios/Base/BaseTabBar.dart';
import 'package:flutter/material.dart';

void main() => runApp(ZNOVApp());

class ZNOVApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '追读小说',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BaseTabBarPage(),
    );
  }
}

