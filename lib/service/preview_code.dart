import 'package:flutter/material.dart';
import 'package:flutter_catalogs/commanWidgets/custom_appbar.dart';
import 'package:widget_with_codeview/widget_with_codeview.dart';

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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: CustomAppBar(
          title: titleIndex,
        ),
      ),
      body: WidgetWithCodeView(
        sourceFilePath: widgetPath,
        child: widget,
      ),
    );
  }
}
