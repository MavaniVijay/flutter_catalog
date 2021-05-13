import 'package:flutter/material.dart';
import 'package:flutter_catalogs/commanWidgets/custom_appbar.dart';
import 'package:flutter_catalogs/service/responsive_service.dart';
import 'package:get/get.dart';

import 'widget/box_grid.dart';

class AdvancedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: Desktop(),
      tablet: TabletOrMobile(),
    );
  }
}

class Desktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Advanced Widget'),
      body: boxGrid(),
    );
  }
}

class TabletOrMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(Get.height * 0.07),
            child: customAppBar(title: 'Advanced Widget')),
        body: boxGrid(),
      ),
    );
  }
}
