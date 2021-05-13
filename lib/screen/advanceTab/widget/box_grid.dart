import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalogs/const/color.dart';
import 'package:flutter_catalogs/const/constant.dart';
import 'package:flutter_catalogs/controller/basic_tab_controller.dart';
import 'package:flutter_catalogs/screen/previewWidgetScreen/preview_widget_screen.dart';
import 'package:flutter_catalogs/service/preview_code.dart';
import 'package:flutter_catalogs/service/responsive_service.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget boxGrid({bool isTablet = false}) {
  bool isDesktop = Responsive.isDesktop();
  bool isTablet = Responsive.isTablet();
  bool isMobile = Responsive.isMobile();
  return AnimationLimiter(
    child: GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: kIsWeb
          ? EdgeInsets.only(bottom: 50, left: 20, right: 20, top: 20)
          : EdgeInsets.only(bottom: 50, left: 10, right: 10, top: 20),
      itemCount: advancedContainerList.length,
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
                              title: advancedContainerList[index].title,
                              color: advancedContainerList[index].color,
                              icon: Icon(advancedContainerList[index].icon),
                              widgetBoxModel:
                                  advancedContainerList[index].listWidget)),
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: advancedContainerList[index].color,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          advancedContainerList[index].icon,
                          size: 40,
                        ),
                        SizedBox(
                          height: Get.height * 0.010,
                        ),
                        Text(
                          advancedContainerList[index].title,
                          style: GoogleFonts.acme(
                            letterSpacing: 2,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            ));
      },
    ),
  );
}
