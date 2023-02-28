import 'package:flutter/material.dart';
import 'package:flutter_ref_app/http_methods_crud/todoList.dart';
//import 'package:flutter_ref_app/screens/home_page.dart';

import 'bottom_nav_pages/marvels_dio.dart';
import '../../constants/constants.dart';
import '../../screens/homeScreen.dart';
import 'bottom_nav_pages/bookPage.dart';
import 'bottom_nav_pages/favouritesPage.dart';
import 'bottom_nav_pages/infoPage.dart';
import 'bottom_nav_pages/logs.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List pages = [
    TodoList(),
    InfoPage(),
    PetPage(),
    LogPage(),
    HeroPage(),
    //FavPage()
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        backgroundColor: AppColors.PRIMARY_COLOR_BDark,
        elevation: 25,
        // showSelectedLabels: false,
        // showUnselectedLabels: true,
        iconSize: 25,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: AppColors.ORANGE,
        unselectedItemColor: AppColors.PRIMARY_DARK_LIGHT,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.note_alt_rounded), label: 'Info'),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Pets'),
          BottomNavigationBarItem(icon: Icon(Icons.security), label: 'Logs'),
          BottomNavigationBarItem(icon: Icon(Icons.more), label: 'More'),
          //BottomNavigationBarItem(icon: Icon(Icons.library_add), label: 'Lib'),
        ],

      ),
    );
  }
}
