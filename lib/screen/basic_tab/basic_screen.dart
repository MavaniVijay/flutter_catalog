import 'package:flutter/material.dart';
import 'package:flutter_catalogs/controller/basic_tab_controller.dart';
import 'package:flutter_catalogs/service/responsive_service.dart';
import 'package:get/get.dart';

import 'widget/comman_widgets.dart';

class BasicScreen extends StatefulWidget {
  @override
  _BasicScreenState createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
  BasicTabController _controller = Get.put(BasicTabController());

  @override
  void initState() {
    _controller.searchStr = ''.obs;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: Desktop(),
      mobile: TabletOrMobile(),
      tablet: TabletOrMobile(),
    );
  }
}

/// Desktop format

class Desktop extends StatelessWidget {
  BasicTabController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customAppBar(_controller, context),
        !Responsive.isDesktop() ? searchBar(_controller) : SizedBox(),
        SizedBox(
          height: Get.height * 0.02,
        ),
        GetBuilder(builder: (BasicTabController controller) {
          return controller.searchStr.value == ''
              ? normalWidget()
              : searchWidgetList(controller.searchList.value);
        }),
      ],
    );
  }
}

/// Tablet and mobile Format
class TabletOrMobile extends StatelessWidget {
  BasicTabController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(child: customAppBar(_controller, context)),
        !Responsive.isDesktop() ? searchBar(_controller) : SizedBox(),
        SizedBox(
          height: Get.height * 0.02,
        ),
        GetBuilder(builder: (BasicTabController controller) {
          return controller.searchStr.value == ''
              ? normalWidget()
              : searchWidgetList(controller.searchList.value);
        }),
      ],
    );
  }
}
