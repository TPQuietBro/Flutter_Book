import 'package:flutter/material.dart';

class BookStoreHomeWidget extends StatefulWidget {
  @override
  BookStoreHomeWidgetState createState() => BookStoreHomeWidgetState();
}

class BookStoreHomeWidgetState extends State<BookStoreHomeWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ['书城', '书架', '分类', '我的'];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  Container _getContentBar(String text) {
    return Container(
      alignment: Alignment.center,
      child: Text(text,textScaleFactor: 2),
    );
  }

  Tab _getTab(String text){
    return Tab(text: text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("书城"),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => _getTab(e)).toList(),
          unselectedLabelColor: Colors.black,
          unselectedLabelStyle: TextStyle(fontSize: 12),
          labelStyle: TextStyle(fontSize: 16),
          indicator: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('book_images/Switch tab-line.png'),
              alignment: Alignment.bottomCenter
            ),
          ),
          indicatorSize: TabBarIndicatorSize.label
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return _getContentBar(e);
        }).toList(),
      ),
    );
  }
}
