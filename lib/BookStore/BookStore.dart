import 'package:flutter/material.dart';

class BookStoreHomeWidget extends StatefulWidget{
@override
BookStoreHomeWidgetState createState() => BookStoreHomeWidgetState();

}
class BookStoreHomeWidgetState extends State<BookStoreHomeWidget> with SingleTickerProviderStateMixin{
TabController _tabController;
List tabs = ['书城','书架','分类','我的'];

@override
void initState(){
  super.initState();
  _tabController = TabController(length: tabs.length,vsync: this);
}

@override
Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
        title: Text("书城"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){},
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e)=> Tab(text:e)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e){
            return Container(
              alignment: Alignment.center,
              child: Text(e,textScaleFactor: 2),
            );
          }
        ).toList(),
      ),
  );
}
}