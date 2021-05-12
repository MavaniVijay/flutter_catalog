import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_catalogs/const/color.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar customAppBar({
  @required String title,
}) {
  return AppBar(
    automaticallyImplyLeading: kIsWeb ? false : true,
    title: Text(
      title,
      style: GoogleFonts.acme(
        letterSpacing: 1.2,
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    elevation: 2,
    backgroundColor: ColorPalate.appBarColor,
  );
}

// class CustomAppBar extends StatelessWidget {
//   final String title;
//   CustomAppBar({@required this.title});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 100,
//       child: Container(
//         decoration: BoxDecoration(
//           color: ColorPalate.appBarColor,
//           // borderRadius: BorderRadius.only(
//           //     bottomLeft: Radius.circular(20),
//           //     bottomRight: Radius.circular(20))
//         ),
//         child: Container(
//           margin: EdgeInsets.fromLTRB(8, 20, 8, 0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               InkResponse(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Icon(
//                   Icons.navigate_before,
//                   size: 30,
//                   color: Colors.white,
//                 ),
//               ),
//               Text(
//                 title,
//                 style: GoogleFonts.acme(fontSize: 20, color: Colors.white),
//               ),
//               Container(
//                 height: 30,
//                 width: 30,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   color: Colors.white,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: FlutterLogo(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
