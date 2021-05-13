import 'package:flutter/material.dart';
import 'package:flutter_catalogs/const/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Row(
            children: [
              FlutterLogo(),
              Text(
                kAppName,
                style: GoogleFonts.acme(
                  letterSpacing: 2,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
