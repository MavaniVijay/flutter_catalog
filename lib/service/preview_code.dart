import 'package:flutter/material.dart';
import 'package:flutter_catalogs/commanWidgets/custom_appbar.dart';
import 'package:flutter_catalogs/customPackage/widget_with_codeview.dart';

import 'responsive_service.dart';

class PreviewCode extends StatelessWidget {
  PreviewCode({
    @required this.titleIndex,
    this.widget,
    this.widgetPath,
  });

  final String titleIndex;
  final Widget widget;
  final String widgetPath;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: Desktop(
          titleIndex: titleIndex, widgetPath: widgetPath, widget: widget),
      tablet: TabletOrMobile(
          titleIndex: titleIndex, widgetPath: widgetPath, widget: widget),
      mobile: TabletOrMobile(
          titleIndex: titleIndex, widgetPath: widgetPath, widget: widget),
    );
  }
}

class Desktop extends StatelessWidget {
  const Desktop({
    Key key,
    @required this.titleIndex,
    @required this.widgetPath,
    @required this.widget,
  }) : super(key: key);

  final String titleIndex;
  final String widgetPath;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: customAppBar(
              title: titleIndex,
            ),
          ),
          Expanded(
            child: CustomWidgetWithCodeView(
              sourceFilePath: widgetPath,
              child: widget,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}

class TabletOrMobile extends StatelessWidget {
  const TabletOrMobile({
    Key key,
    @required this.titleIndex,
    @required this.widgetPath,
    @required this.widget,
  }) : super(key: key);

  final String titleIndex;
  final String widgetPath;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: customAppBar(
          title: titleIndex,
        ),
      ),
      body: CustomWidgetWithCodeView(
        sourceFilePath: widgetPath,
        child: widget,
      ),
    );
  }
}
