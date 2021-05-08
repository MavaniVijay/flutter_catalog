import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvancedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.03,
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(bottom: 50, left: 10, right: 10),
              //itemCount: advancedContainerList.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 4 / 4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15),
              itemBuilder: (context, index) {
                return InkResponse(
                  onTap: () {
                    print("Index ${index}....");
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => WidgetScreen(
                    //           title: list[index].title,
                    //           color: list[index].color,
                    //           text: list[index].title,
                    //           icon: list[index].icon,
                    //           widgetList: list[index].listWidget)),
                    // );
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      // color: advancedContainerList[index].color,
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
                        // advancedContainerList[index].icon,
                        SizedBox(
                          height: Get.height * 0.010,
                        ),
                        // Text(
                        //    advancedContainerList[index].title,
                        //   style: GoogleFonts.acme(
                        //     letterSpacing: 2,
                        //     color: Colors.black,
                        //     fontSize: 20,
                        //   ),
                        // ),
                      ],
                    )),
                  ),
                );
              },
              physics: BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}

// List<ContainerList> advancedContainerList = [
//   ContainerList(
//       title: "Animation (advanced)",
//       color: Color(0xffe57373),
//       icon: Icon(Icons.height),
//       listWidget: basicListWidget),
//   ContainerList(
//       title: "MultiMedia",
//       color: Color(0xff64b5f6),
//       icon: Icon(Icons.height),
//       listWidget: basicListWidget),
//   ContainerList(
//       title: "Persistence",
//       color: Color(0xff9575cd),
//       icon: Icon(Icons.height),
//       listWidget: basicListWidget),
//   ContainerList(
//       title: "State Management",
//       color: Color(0xff4db6ac),
//       icon: Icon(Icons.height),
//       listWidget: basicListWidget),
//   ContainerList(
//       title: "Plugins",
//       color: Color(0xff81c784),
//       icon: Icon(Icons.height),
//       listWidget: basicListWidget),
//   ContainerList(
//       title: "Charts",
//       color: Color(0xffe0e0e0),
//       icon: Icon(Icons.height),
//       listWidget: basicListWidget),
//   ContainerList(
//       title: "Networking",
//       color: Color(0xfffff176),
//       icon: Icon(Icons.height),
//       listWidget: basicListWidget),
//   ContainerList(
//       title: "FireBase",
//       color: Color(0xffa1887f),
//       icon: Icon(Icons.height),
//       listWidget: basicListWidget),
// ];
