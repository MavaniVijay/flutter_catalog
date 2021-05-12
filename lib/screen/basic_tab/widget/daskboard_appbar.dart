import 'package:flutter/material.dart';
import 'package:flutter_catalogs/screen/basic_tab/widget/search_bar.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/color.dart';
import '../../../controller/basic_tab_controller.dart';
import '../../../service/responsive_service.dart';
import 'without_search_list.dart';

Container dashBoardAppBar(BasicTabController con, BuildContext context) {
  return Container(
    height: Get.height * 0.07,
    // width: Get.width,
    color: ColorPalate.appBarColor,
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Flutter Learn',
          style: GoogleFonts.acme(
            letterSpacing: 2,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        Spacer(),
        Responsive.isDesktop() ? Expanded(child: searchBar(con)) : SizedBox(),
        GetBuilder<BasicTabController>(
            builder: (BasicTabController controller) {
          return FlutterSwitch(
            width: 55.0,
            height: 35.0,
            toggleSize: 30.0,
            value: controller.status.value,
            borderRadius: 20.0,
            padding: 3,
            activeToggleColor: Color(0xFF6E40C9),
            inactiveToggleColor: Color(0xFF2F363D),
            activeSwitchBorder: Border.all(
              color: Color(0xFF3C1E70),
              width: 0.0,
            ),
            inactiveSwitchBorder: Border.all(
              color: Color(0xFFD1D5DA),
              width: 0.0,
            ),
            activeColor: Color(0xFF271052),
            inactiveColor: Color(0xffffffff),
            activeIcon: Icon(
              Icons.nightlight_round,
              color: Color(0xFFF8E3A1),
            ),
            inactiveIcon: Icon(
              Icons.wb_sunny,
              color: Color(0xFFFFDF5D),
            ),
            onToggle: (val) {
              con.status = val.obs;
            },
          );
        }),
      ],
    ),
  );
}
