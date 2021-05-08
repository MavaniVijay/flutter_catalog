import 'package:flutter/cupertino.dart';
import 'package:flutter_catalogs/all_widgets/card_inkresponse_widget.dart';
import 'package:flutter_catalogs/all_widgets/container_widget.dart';
import 'package:flutter_catalogs/all_widgets/icon_widget.dart';
import 'package:flutter_catalogs/all_widgets/image_widget.dart';
import 'package:flutter_catalogs/all_widgets/row_column_widget.dart';
import 'package:flutter_catalogs/all_widgets/text_filed_widget.dart';
import 'package:flutter_catalogs/all_widgets/text_widget.dart';

/// Basic Screen in Multiple Widget ///
const String basePath = "lib/all_widgets/";
const Map<String, String> kWidgetList = {
  'Icon': "${basePath}icon_widget.dart",
  'Container': "${basePath}container_widget.dart",
  'Text': "${basePath}text_widget.dart",
  'RowColumn': "${basePath}row_column_widget.dart",
  'TextFiled': "${basePath}text_filed_widget.dart",
  'Image': "${basePath}image_widget.dart",
  'CardInkResponse': "${basePath}card_inkresponse_widget.dart",
};

getWidgetClass(String title) {
  if (title == 'Icon') {
    return IconScreen();
  } else if (title == 'Container') {
    return ContainerWidget();
  } else if (title == 'Text') {
    return TextWidget();
  } else if (title == 'RowColumn') {
    return RowColumn();
  } else if (title == 'TextFiled') {
    return TextFieldExample();
  } else if (title == 'Image') {
    return ImageWidget();
  } else if (title == 'CardInkResponse') {
    return CardInkResponseWidget();
  } else {
    return Center(
      child: Text("No Data Found"),
    );
  }
}
