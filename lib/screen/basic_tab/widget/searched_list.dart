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
