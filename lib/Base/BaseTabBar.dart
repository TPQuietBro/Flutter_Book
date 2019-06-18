import 'package:flutter/material.dart';
import 'package:book_ios/BookStore/BookStore.dart';
import 'package:book_ios/Classify/Classify.dart';
import 'package:book_ios/Personal/Personal.dart';
import 'package:book_ios/Shelf/BookShelf.dart';

class BaseTabBarPage extends StatefulWidget {
  @override
  BaseTabBarState createState() => BaseTabBarState();
}

class BaseTabBarState extends State<BaseTabBarPage> {
  int _selectedIndex = 1;

  List<Widget> subPages = List<Widget>();

  @override
  void initState() {
    super.initState();

    initSDK();

    subPages
      ..add(BookStoreHomeWidget())
      ..add(BookShelfWidget())
      ..add(ClassifyWidget())
      ..add(PersonalWidget());
  }

  void initSDK(){
    
  }

  Text _getTabBarText(String title, [int index]) {
    return Text(title);
  }

  Image _getTabBarNomalImage(String normalImage) {
    return Image.asset(normalImage, width: 24, height: 24);
  }

  Image _getTabBarSelectedImage(String selectedImage) {
    return Image.asset(selectedImage, width: 24, height: 24);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: subPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: _getTabBarNomalImage('book_images/tab/home-normal.png'),
              activeIcon:
                  _getTabBarSelectedImage('book_images/tab/home-selected.png'),
              title: _getTabBarText('书城',0)),
          BottomNavigationBarItem(
              icon: _getTabBarNomalImage('book_images/tab/book-normal.png'),
              activeIcon:
                  _getTabBarSelectedImage('book_images/tab/book-selected.png'),
              title: _getTabBarText('书架',1)),
          BottomNavigationBarItem(
              icon: _getTabBarNomalImage('book_images/tab/fenlei-normal.png'),
              activeIcon: _getTabBarSelectedImage(
                  'book_images/tab/fenlei-selected.png'),
              title: _getTabBarText('分类',2)),
          BottomNavigationBarItem(
              icon: _getTabBarNomalImage('book_images/tab/profile-normal.png'),
              activeIcon: _getTabBarSelectedImage(
                  'book_images/tab/profile-selected.png'),
              title: _getTabBarText('我的',3)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFFF6B2D),
        unselectedItemColor: const Color(0xFF949499),
        selectedFontSize: 11,
        unselectedFontSize: 11,
        onTap: _onTappedBottom,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  _onTappedBottom(int selectedItem) {
    setState(() {
      _selectedIndex = selectedItem;
    });
  }
}
