import 'package:flutter/material.dart';

class BookStoreHomeWidget extends StatefulWidget {
  @override
  BookStoreHomeWidgetState createState() => BookStoreHomeWidgetState();
}

class BookStoreHomeWidgetState extends State<BookStoreHomeWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ['书城', '书架', '分类', '我的'];
  int _index = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this)
    ..addListener((){
      setState(() {
        _index = _tabController.index;
        print('index1 = $_index');
      });
    });
  }

  Container _getContentBar(String text) {
    return Container(
      alignment: Alignment.center,
      child: Text(text,textScaleFactor: 2)
    );
  }

  Tab _getTab(String text){
    print('index2 = $_index');
    return Tab(
      child: Text(
      text,style: TextStyle(
        fontSize: _index == 0 ? 12 : 16
        )
      )
    );
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
          // unselectedLabelStyle: TextStyle(fontSize: 12),
          // labelStyle: TextStyle(fontSize: 14),
          labelPadding: EdgeInsets.only(bottom: 0,top: 0),
          indicator: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('book_images/Switch tab-line.png'),
              alignment: Alignment.bottomCenter
            ),
          ),
          indicatorSize: TabBarIndicatorSize.label,
          // onTap: (index){
          //   setState(() {
          //     _index = index;
          //   });
          // },
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
