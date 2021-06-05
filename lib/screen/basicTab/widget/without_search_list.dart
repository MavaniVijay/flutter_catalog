import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalogs/const/constant.dart';
import 'package:flutter_catalogs/screen/previewWidgetScreen/preview_widget_screen.dart';
import 'package:flutter_catalogs/service/responsive_service.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Expanded normalWidget({bool isTablet = false}) {
  bool isDesktop = Responsive.isDesktop();
  bool isTablet = Responsive.isTablet();
  bool isMobile = Responsive.isMobile();
  return Expanded(
    child: AnimationLimiter(
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: kIsWeb
            ? EdgeInsets.only(bottom: 50, left: 20, right: 20)
            : EdgeInsets.only(bottom: 50, left: 10, right: 10),
        itemCount: kBasicTabList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile
                ? 2
                : isDesktop
                    ? 4
                    : 3,
            childAspectRatio: isDesktop ? 1 / 0.6 : 1 / 1,
            crossAxisSpacing: kIsWeb ? 25 : 15,
            mainAxisSpacing: kIsWeb ? 25 : 15),
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
              position: index,
              columnCount: kBasicTabList.length,
              child: ScaleAnimation(
                duration: Duration(seconds: 1),
                curve: Curves.bounceOut,
                child: FadeInAnimation(
                  duration: Duration(seconds: 1),
                  child: InkResponse(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewWidgetScreen(
                                title: kBasicTabList[index].title,
                                color: kBasicTabList[index].color,
                                icon: Icon(kBasicTabList[index].icon),
                                widgetBoxModel:
                                    kBasicTabList[index].listWidget)),
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
                            size: 40,
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
                  ),
                ),
              ));
        },
      ),
    ),
  );
}
