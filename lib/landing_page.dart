import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:fastival/screen/home_page.dart';
import 'package:fastival/screen/profile_page.dart';
import 'package:fastival/screen/search_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

final page = [HomePage(), SearchPage(), ProfilePage()];

class _LandingPageState extends State<LandingPage> {
  String name = "", age = " ", password = "";
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[pageIndex],
      bottomNavigationBar: BottomNavyBar(
        onItemSelected: (int value) {
          setState(() {
            pageIndex = value;
          });
        },
        backgroundColor: Colors.white,
        curve: Curves.easeInOutCirc,
        itemCornerRadius: 1200,
        iconSize: 20,
        showElevation: true,
        animationDuration: Duration(seconds: 1),
        selectedIndex: pageIndex,
        items: [
          BottomNavyBarItem(
            activeColor: Colors.orange,
            inactiveColor: Colors.black,
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
          )
        ],
      ),
    );
  }
}
