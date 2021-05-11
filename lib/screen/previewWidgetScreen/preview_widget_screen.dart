import 'package:flutter/material.dart';
import 'package:flutter_catalogs/const/color.dart';
import 'package:flutter_catalogs/const/constant.dart';
import 'package:flutter_catalogs/model/widgetBoxModel.dart';
import 'package:flutter_catalogs/service/preview_code.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PreviewWidgetScreen extends StatefulWidget {
  PreviewWidgetScreen(
      {@required this.title,
      @required this.color,
      @required this.text,
      @required this.icon,
      @required this.widgetBoxModel});

  final String title;
  final Color color;
  final String text;
  final Icon icon;
  final List<WidgetBoxModel> widgetBoxModel;

  @override
  _WidgetScreenState createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<PreviewWidgetScreen> {
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
                      fontSize: 50,
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
                itemCount: widget.widgetBoxModel.length,
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
                        String title = widget.widgetBoxModel[index].title;
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
                          color: widget.widgetBoxModel[index].color,
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
                                      widget.widgetBoxModel[index].title,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.arvo(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(Icons.double_arrow),
                                    // icon: widget.widgetBoxModel[index].icon2,
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
