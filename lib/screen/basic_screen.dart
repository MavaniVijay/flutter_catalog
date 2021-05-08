import 'package:flutter/material.dart';
import 'package:flutter_catalogs/constant/color_platee.dart';
import 'package:flutter_catalogs/controller/search_widget_controller.dart';
import 'package:flutter_catalogs/list/basic_screen_list.dart';
import 'package:flutter_catalogs/list/collection_all_widget.dart';
import 'package:flutter_catalogs/path_set/set_path_all_widget.dart';
import 'package:flutter_catalogs/screen/widget_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common_code.dart';

class BasicScreen extends StatefulWidget {
  @override
  _BasicScreenState createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
  SearchWidgetController _controller = Get.put(SearchWidgetController());
  @override
  void initState() {
    _controller.searchStr = ''.obs;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 15),
          height: Get.height * 0.07,
          decoration: BoxDecoration(
            color: Color(0xffDDE8F8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: TextField(
              keyboardType: TextInputType.text,
              inputFormatters: [],
              style: GoogleFonts.libreBaskerville(fontSize: 14),
              onChanged: (str) {
                if (str.isEmpty) {
                  _controller.searchStr = ''.obs;
                } else {
                  _controller.searchStr = str.trim().obs;
                }
                List<String> list = <String>[];
                collectionListWidget.forEach((element) {
                  if (element.toLowerCase().contains(str.trim().toLowerCase()))
                    list.add(element);
                });
                _controller.searchList = list.obs;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search Catalog",
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorPalate.subTextColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.02,
        ),
        GetBuilder(builder: (SearchWidgetController controller) {
          return controller.searchStr.value == ''
              ? normalWidget()
              : searchWidgetList(controller.searchList.value);
        }),
      ],
    );
  }

  Widget searchWidgetList(List<String> list) => Expanded(
        child: list.length < 1
            ? Center(
                child: Text('Not found widget'),
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
                                builder: (context) => CommonCode(
                                      widget: getWidgetClass(title),
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

  Expanded normalWidget() {
    return Expanded(
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 50, left: 10, right: 10),
        itemCount: list.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 4 / 4,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15),
        itemBuilder: (context, index) {
          return InkResponse(
            onTap: () {
              print("Index ${index}....");
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WidgetScreen(
                        title: list[index].title,
                        color: list[index].color,
                        text: list[index].title,
                        icon: list[index].icon,
                        widgetList: list[index].listWidget)),
              );
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: list[index].color,
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
                  list[index].icon,
                  SizedBox(
                    height: Get.height * 0.010,
                  ),
                  Text(
                    list[index].title,
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
}
