import 'package:flutter/material.dart';
import 'package:flutter_catalogs/const/color.dart';
import 'package:flutter_catalogs/const/constant.dart';
import 'package:flutter_catalogs/controller/basic_tab_controller.dart';
import 'package:flutter_catalogs/screen/previewWidgetScreen/preview_widget_screen.dart';
import 'package:flutter_catalogs/service/preview_code.dart';
import 'package:flutter_catalogs/service/responsive_service.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Container searchBar(
  BasicTabController controller,
) {
  bool isDesktop = Responsive.isDesktop();
  return Container(
    margin: isDesktop
        ? EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5)
        : EdgeInsets.only(right: 20, left: 20, top: 15),
    height: Get.height * 0.07,
    decoration: BoxDecoration(
      color: Color(0xffDDE8F8),
      borderRadius: BorderRadius.circular(10),
    ),
    alignment: Alignment.center,
    child: TextField(
      keyboardType: TextInputType.text,
      inputFormatters: [],
      style: GoogleFonts.libreBaskerville(fontSize: 14),
      onChanged: (str) {
        if (str.isEmpty) {
          controller.searchStr = ''.obs;
        } else {
          controller.searchStr = str.trim().obs;
        }
        List<String> list = <String>[];
        kCollectionListWidget.forEach((element) {
          if (element.toLowerCase().contains(str.trim().toLowerCase()))
            list.add(element);
        });
        controller.searchList = list.obs;
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Search Catalog",
        contentPadding: EdgeInsets.only(top: isDesktop ? 12 : 15),
        prefixIcon: Icon(
          Icons.search,
          color: ColorPalate.subTextColor,
        ),
      ),
    ),
  );
}
