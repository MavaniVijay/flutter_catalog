import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalogs/const/color.dart';
import 'package:flutter_catalogs/screen/advance_tab/advanced_screen.dart';
import 'package:flutter_catalogs/screen/basic_tab/basic_screen.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';

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
            title: "Basic",
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
      // appBar: AppBar(
      //   title: Text(
      //     "Welcome\n Flutter Catalog' 2.0",
      //     style: GoogleFonts.acme(fontSize: 15, letterSpacing: 1),
      //   ),
      //   elevation: 2,
      //   backgroundColor: ColorPalate.appBarColor,
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(15.0),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: <Widget>[
      //           FlutterSwitch(
      //             width: 50.0,
      //             height: 55.0,
      //             toggleSize: 45.0,
      //             value: status,
      //             borderRadius: 20.0,
      //             padding: 2.0,
      //             activeToggleColor: Color(0xFF6E40C9),
      //             inactiveToggleColor: Color(0xFF2F363D),
      //             activeSwitchBorder: Border.all(
      //               color: Color(0xFF3C1E70),
      //               width: 0.0,
      //             ),
      //             inactiveSwitchBorder: Border.all(
      //               color: Color(0xFFD1D5DA),
      //               width: 0.0,
      //             ),
      //             activeColor: Color(0xFF271052),
      //             inactiveColor: Color(0xffffffff),
      //             activeIcon: Icon(
      //               Icons.nightlight_round,
      //               color: Color(0xFFF8E3A1),
      //             ),
      //             inactiveIcon: Icon(
      //               Icons.wb_sunny,
      //               color: Color(0xFFFFDF5D),
      //             ),
      //             onToggle: (val) {
      //               setState(() {
      //                 status = val;
      //
      //                 if (val) {
      //                   _textColor = Colors.white;
      //                   _appBarColor = Color.fromRGBO(22, 27, 34, 1);
      //                   _scaffoldBgcolor = Color(0xFF0D1117);
      //                 } else {
      //                   _textColor = Colors.black;
      //                   _appBarColor = Color.fromRGBO(36, 41, 46, 1);
      //                   _scaffoldBgcolor = Colors.white;
      //                 }
      //               });
      //             },
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      body: IndexedStack(
        index: currentPage,
        children: [
          BasicScreen(),
          AdvancedScreen(),
          Text("Hello where"),
          Text("i am fine "),
        ],
      ),
    );
  }
}
