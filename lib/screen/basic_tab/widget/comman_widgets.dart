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

Container customAppBar(BasicTabController con, BuildContext context) {
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
        contentPadding: isDesktop ? EdgeInsets.zero : EdgeInsets.only(top: 15),
        prefixIcon: Icon(
          Icons.search,
          color: ColorPalate.subTextColor,
        ),
      ),
    ),
  );
}

Widget searchWidgetList(List<String> list) => Expanded(
      child: list.length < 1
          ? Center(
              child: Text('Not found screen.basic_tab.widget'),
            )
          : ListView.builder(
              itemCount: list.length,
              padding: EdgeInsets.only(bottom: 50, left: 10, right: 10),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkResponse(
                    onTap: () {
                      print("Icon Check....");
                      String title = list[index];
                      // print("${kWidgetList[title]['path']}");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PreviewCode(
                                    widget: kGetWidgetClass(title),
                                    widgetPath: kWidgetList[title],
                                    titleIndex: title,
                                  )));
                    },
                    child: Container(
                      height: Get.height * 0.08,
                      width: Get.width,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300],
                            offset: const Offset(
                              2.0,
                              2.0,
                            ),
                            blurRadius: 8.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.favorite_border),
                                  onPressed: () {},
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: Get.height * 0.020,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    list[index],
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.arvo(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                  icon: Icon(Icons.double_arrow),
                                  onPressed: () {},
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
    );

Expanded normalWidget({bool isTablet = false}) {
  bool isDesktop = Responsive.isDesktop();
  bool isTablet = Responsive.isTablet();
  bool isMobile = Responsive.isMobile();
  return Expanded(
    child: GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(bottom: 50, left: 10, right: 10),
      itemCount: kBasicTabList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isMobile
              ? 2
              : isDesktop
                  ? 4
                  : 3,
          childAspectRatio: isDesktop ? 1 / 0.6 : 1 / 1,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15),
      itemBuilder: (context, index) {
        return InkResponse(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PreviewWidgetScreen(
                      title: kBasicTabList[index].title,
                      color: kBasicTabList[index].color,
                      text: kBasicTabList[index].title,
                      icon: Icon(kBasicTabList[index].icon),
                      widgetBoxModel: kBasicTabList[index].listWidget)),
            );
          },
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: kBasicTabList[index].color,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  offset: const Offset(
                    10.0,
                    5.0,
                  ),
                  blurRadius: 8.0,
                  spreadRadius: 2.0,
                ),
              ],
              // image: DecorationImage(
              //   colorFilter: ColorFilter.mode(
              //       Colors.grey.withOpacity(0.4), BlendMode.multiply),
              // ),
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  kBasicTabList[index].icon,
                  size: isDesktop ? Get.width * 0.05 : Get.width * 0.08,
                ),
                SizedBox(
                  height: Get.height * 0.010,
                ),
                Text(
                  kBasicTabList[index].title,
                  style: GoogleFonts.acme(
                    letterSpacing: 2,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ],
            )),
          ),
        );
      },
    ),
  );
}
