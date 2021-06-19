import 'package:flutter/material.dart';
import 'package:flutter_catalogs/const/constant.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: Get.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.05,
            ),
            Text(
              kAppName,
              style: GoogleFonts.acme(
                letterSpacing: 2,
                fontSize: 20,
              ),
            ),
            Divider(
              height: 15,
              indent: 10,
              endIndent: 20,
              thickness: 2,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Image.asset(
              'assets/images/pngimg/Flutter_logo_main.png',
              height: 100,
              width: 100,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Text(
              "Flutter Collection",
              style: GoogleFonts.acme(
                fontSize: 17,
              ),
            ),
            Text(
              "v2.5.8",
              style:
                  GoogleFonts.acme(fontSize: 17, color: Colors.grey.shade500),
            ),
            Text("An App "),

          ],
        ),
      ),
    );
  }
}
