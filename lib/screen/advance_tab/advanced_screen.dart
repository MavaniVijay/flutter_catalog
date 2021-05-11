import 'package:flutter/material.dart';
import 'package:flutter_catalogs/const/color.dart';
import 'package:flutter_catalogs/const/constant.dart';
import 'package:flutter_catalogs/screen/previewWidgetScreen/preview_widget_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AdvancedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Flutter Widgets (Advanced)",
          style: GoogleFonts.acme(fontSize: 15, letterSpacing: 2),
        ),
        elevation: 2,
        backgroundColor: ColorPalate.appBarColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(bottom: 50, left: 10, right: 10),
                itemCount: advancedContainerList.length,
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
                            builder: (context) => PreviewWidgetScreen(
                                title: advancedContainerList[index].title,
                                color: advancedContainerList[index].color,
                                text: advancedContainerList[index].title,
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
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            advancedContainerList[index].icon,
                          ),
                          SizedBox(
                            height: Get.height * 0.010,
                          ),
                          Text(
                            advancedContainerList[index].title,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.acme(
                              letterSpacing: 2,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                physics: BouncingScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
