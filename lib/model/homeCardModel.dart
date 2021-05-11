import 'package:flutter/material.dart';
import 'package:flutter_catalogs/model/widgetBoxModel.dart';

class HomeCardModel {
  HomeCardModel(
      {@required this.title,
      @required this.color,
      @required this.icon,
      @required this.listWidget});

  String title;
  Color color;
  IconData icon;
  List<WidgetBoxModel> listWidget;
}
