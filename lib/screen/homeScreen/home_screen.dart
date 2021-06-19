import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalogs/screen/aboutTab/about_screen.dart';
import 'package:flutter_catalogs/screen/advanceTab/advanced_screen.dart';
import 'package:flutter_catalogs/screen/basicTab/basic_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool status = false;
  Color _textColor = Colors.black;
  Color _appBarColor = Color.fromRGBO(36, 41, 46, 1);
  Color _scaffoldBgcolor = Colors.white;
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: FancyBottomNavigation(
        key: bottomNavigationKey,
        initialSelection: 0,
        tabs: [
          TabData(
            iconData: Icons.list_alt_outlined,
            title: "Basics",
          ),
          TabData(
              iconData: Icons.featured_play_list_outlined, title: "Advanced"),
          TabData(iconData: Icons.favorite_border, title: "Favourite"),
          TabData(iconData: Icons.info_outline, title: "About"),
        ],
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
      body: IndexedStack(
        index: currentPage,
        children: [
          BasicScreen(),
          AdvancedScreen(),
          Text("Hello where"),
          AboutScreen(),
        ],
      ),
    );
  }
}
