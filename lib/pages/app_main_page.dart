import 'package:flutter/material.dart';
import 'package:the_library/pages/home_page.dart';
import 'package:the_library/pages/library_page.dart';
import 'package:the_library/resources/colors.dart';
import 'package:the_library/resources/strings.dart';

class AppMainPage extends StatefulWidget {
  @override
  State<AppMainPage> createState() => _AppMainPageState();
}

class _AppMainPageState extends State<AppMainPage> {
  int _currentPageIndex = 0;
  final _mPages = [
    HomePage(),
    LibraryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_WHITE,
      body: _mPages.elementAt(_currentPageIndex),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: _currentPageIndex,
        onTap: (index) => _onTapButtonNavigationItem(index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: HOME,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_books_outlined,
            ),
            label: LIBRARY,
          ),
        ],
      ),
    );
  }

  void _onTapButtonNavigationItem(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }
}
