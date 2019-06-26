import 'package:flutter/material.dart';

class BookShelfWidget extends StatefulWidget {
  @override
  BookShelfWidgetState createState() => BookShelfWidgetState();
}

class BookShelfWidgetState extends State<BookShelfWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("书架"),
      ),
    );
  }
}
