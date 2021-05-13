import 'package:flutter/material.dart';
import 'package:flutter_catalogs/model/widgetBoxModel.dart';
import '../../commanWidgets/custom_appbar.dart';
import '../../service/responsive_service.dart';
import 'widget/build_body.dart';

class PreviewWidgetScreen extends StatelessWidget {
  PreviewWidgetScreen(
      {@required this.title,
      @required this.color,
      @required this.icon,
      @required this.widgetBoxModel});

  final String title;
  final Color color;
  final Icon icon;
  final List<WidgetBoxModel> widgetBoxModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: title),
      body: BuildBody(
        color: color,
        title: title,
        icon: icon,
        widgetBoxModel: widgetBoxModel,
      ),
    );
  }
}
