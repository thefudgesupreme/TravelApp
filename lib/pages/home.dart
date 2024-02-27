import 'package:flutter/material.dart';
import 'package:travel_app/pages/navpages/main_page.dart';
import 'package:travel_app/pages/navpages/bar_item_page.dart';
import 'package:travel_app/pages/navpages/my_page.dart';
import 'package:travel_app/pages/navpages/search_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List pages = [
    MainPage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];
  int currIndex = 0;

  void onTap(int index) {
    setState(() {
      currIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: pages[currIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          onTap: onTap,
          currentIndex: currIndex,
          selectedItemColor: Colors.black54,
          unselectedFontSize: 0,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showSelectedLabels: true,
          showUnselectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              label: "Home Page",
              icon: Icon(Icons.apps),
            ),
            BottomNavigationBarItem(
              label: "Bar Items",
              icon: Icon(Icons.bar_chart),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person),
            ),
          ]),
    );
  }
}
