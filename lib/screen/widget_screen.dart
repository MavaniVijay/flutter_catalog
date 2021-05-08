import 'package:flutter/material.dart';
import 'package:flutter_catalogs/constant/color_platee.dart';
import 'package:flutter_catalogs/list/collection_all_widget.dart';
import 'package:flutter_catalogs/path_set/set_path_all_widget.dart';
import 'package:flutter_catalogs/screen/common_code.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetScreen extends StatefulWidget {
  WidgetScreen(
      {@required this.title,
      @required this.color,
      @required this.text,
      @required this.icon,
      @required this.widgetList});
  final String title;
  final Color color;
  final String text;
  final Icon icon;
  final List<WidgetList> widgetList;

  @override
  _WidgetScreenState createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.acme(fontSize: 15, letterSpacing: 1),
        ),
        elevation: 2,
        backgroundColor: ColorPalate.appBarColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 5,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: FlutterLogo(),
                )),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              height: Get.height * 0.30,
              width: Get.width,
              decoration: BoxDecoration(
                color: widget.color,
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
                  IconButton(
                    icon: widget.icon,
                    onPressed: () {},
                    iconSize: 50,
                    color: Colors.black26,
                  ),
                  SizedBox(
                    height: Get.height * 0.010,
                  ),
                  Text(
                    widget.text,
                    style: GoogleFonts.acme(
                      letterSpacing: 2,
                      color: Colors.black38,
                      fontSize: 25,
                    ),
                  ),
                ],
              )),
            ),
            SizedBox(
              height: Get.height * 0.020,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style:
                      GoogleFonts.libreBaskerville(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sell all",
                  style: GoogleFonts.questrial(fontSize: 13),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.020,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.widgetList.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: index == 0
                        ? EdgeInsets.only(
                            top: 15,
                          )
                        : EdgeInsets.only(
                            top: 13,
                          ),
                    child: InkResponse(
                      onTap: () {
                        print("Icon Check....");
                        String title = widget.widgetList[index].title;
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
                          color: widget.widgetList[index].color,
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
                                    // icon: widget.widgetList[index].icon1,
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
                                      widget.widgetList[index].title,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.arvo(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(Icons.double_arrow),
                                    // icon: widget.widgetList[index].icon2,
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
