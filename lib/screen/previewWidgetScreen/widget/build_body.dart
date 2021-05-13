import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../const/color.dart';
import '../../../const/constant.dart';
import '../../../model/widgetBoxModel.dart';
import '../../../service/preview_code.dart';
import '../../../service/responsive_service.dart';
import '../preview_widget_screen.dart';

class BuildBody extends StatelessWidget {
  final String title;
  final Color color;
  final Icon icon;
  final List<WidgetBoxModel> widgetBoxModel;

  const BuildBody({
    Key key,
    this.title,
    this.color,
    this.icon,
    this.widgetBoxModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop();
    return Padding(
      padding: EdgeInsets.only(
          left: 20, right: kIsWeb ? 0 : 20, top: 10, bottom: 10),
      child: !kIsWeb
          ? buildColumn(context)
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: buildColumn(context),
            ),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, right: kIsWeb ? 20 : 0),
          height: kIsWeb ? 200 : Get.height * 0.30,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: color,
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
                icon: icon,
                onPressed: () {},
                iconSize: 40,
                color: Colors.black26,
              ),
              SizedBox(
                height: Get.height * 0.010,
              ),
              Text(
                title,
                style: GoogleFonts.acme(
                  letterSpacing: 2,
                  color: Colors.black38,
                  fontSize: 30,
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
              title,
              style: GoogleFonts.libreBaskerville(
                  fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Text(
                    "See all",
                    style: GoogleFonts.questrial(
                        fontSize: 13, color: ColorPalate.appBarColor),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: Get.height * 0.020,
        ),
        kIsWeb
            ? buildListView()
            : Expanded(
                child: buildListView(),
              ),
      ],
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: widgetBoxModel.length,
      shrinkWrap: kIsWeb ? true : false,
      physics:
          kIsWeb ? NeverScrollableScrollPhysics() : BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: index == 0
              ? EdgeInsets.only(
                  top: 15,
                  right: 20,
                )
              : EdgeInsets.only(
                  top: 13,
                  right: 20,
                ),
          child: InkResponse(
            onTap: () {
              print("Icon Check....");
              String title = widgetBoxModel[index].title;
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
              height: 60,
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
                color: widgetBoxModel[index].color,
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
                            widgetBoxModel[index].title,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.arvo(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.double_arrow),
                          // icon: widgetBoxModel[index].icon2,
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
    );
  }
}
