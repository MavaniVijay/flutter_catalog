import 'package:flutter/material.dart';

class ContainerList {
  ContainerList(
      {@required this.title,
      @required this.color,
      @required this.icon,
      @required this.listWidget});
  String title;
  Color color;
  Icon icon;
  List<WidgetList> listWidget;
}

class WidgetList {
  WidgetList(
      {@required this.title,
      @required this.color,
      @required this.icon1,
      @required this.icon2});
  String title;
  Color color;
  Icon icon1;
  Icon icon2;
}

/// Basic Screen ...... ///
List<WidgetList> listWidget = [
  WidgetList(
    title: "Icon",
    color: Color(0xff1b5e20),
    icon1: Icon(Icons.favorite_border),
    icon2: Icon(Icons.double_arrow),
  ),
  WidgetList(
      title: "Text",
      color: Color(0xff2e7d32),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "TextFiled",
      color: Color(0xff388e3c),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Image",
      color: Color(0xff43a047),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Card,InkResponse",
      color: Color(0xff4caf50),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Gradient",
      color: Color(0xff4caf50),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Buttons",
      color: Color(0xff43a047),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Dropdown & Menu Button",
      color: Color(0xff388e3c),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "TextFormFiled",
      color: Color(0xff2e7d32),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Other Stateful Widgets",
      color: Color(0xff1b5e20),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
];

List<WidgetList> listLayout = [
  WidgetList(
      title: "Container",
      color: Color(0xfff57f17),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Row,Column",
      color: Color(0xfff9a825),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Warp",
      color: Color(0xfffbc02d),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Fractionally SizedBox",
      color: Color(0xfffdd835),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Expanded, SizedBox",
      color: Color(0xffffeb3b),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Stack",
      color: Color(0xffffee58),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
];

List<WidgetList> listList = [
  WidgetList(
      title: "ListTile",
      color: Color(0xff01579b),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "ListView.builder",
      color: Color(0xff0277bd),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "GridList",
      color: Color(0xff0288d1),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Expansion Tile",
      color: Color(0xff039be5),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Swipe to Dismiss",
      color: Color(0xff03a9f4),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Reorderable List",
      color: Color(0xff29b6f6),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Slidable List Tile",
      color: Color(0xff4fc3f7),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "DataTable",
      color: Color(0xff81d4fa),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
];

List<WidgetList> listAppbar = [
  WidgetList(
      title: "Basic Appbar",
      color: Color(0xffbf360c),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Bottom AppBar & Floating Button",
      color: Color(0xffd84315),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Silver Appbar",
      color: Color(0xffe64a19),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Search",
      color: Color(0xfff4511e),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Backdrop",
      color: Color(0xffff5722),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Convex Appbar",
      color: Color(0xffff7043),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
];

List<WidgetList> listNavigation = [
  WidgetList(
      title: "Tabs",
      color: Color(0xff311b92),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Dialogs",
      color: Color(0xff4527a0),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Routes",
      color: Color(0xff512da8),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Navigation Drawer",
      color: Color(0xff5e35b1),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Bottom Sheet",
      color: Color(0xff673ab7),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Bottom Tab Bar",
      color: Color(0xff673ab7),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Bottom Navigation Bar",
      color: Color(0xff5e35b1),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Page Selector",
      color: Color(0xff512da8),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Draggable Sheet",
      color: Color(0xff4527a0),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
];
List<WidgetList> listAsync = [
  WidgetList(
      title: "Future Builder",
      color: Color(0xff33691e),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Stream Builder(timer App)",
      color: Color(0xff558b2f),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Stream Controller",
      color: Color(0xff689f38),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
];
List<WidgetList> listAnimation = [
  WidgetList(
      title: "Hero",
      color: Color(0xff424242),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Opacity",
      color: Color(0xff616161),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Animated Container",
      color: Color(0xff757575),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
  WidgetList(
      title: "Animation Package",
      color: Color(0xff9e9e9e),
      icon1: Icon(Icons.favorite_border),
      icon2: Icon(Icons.double_arrow)),
];

List<String> collectionListWidget = [
  "Icon",
  "Text",
  "TextFiled",
  "Image",
  "Card,InkResponse",
  "Gradient",
  "Buttons",
  "Dropdown & Menu Button",
  "TextFormFiled",
  "Other Stateful Widgets",
  "Container",
  "Row,Column",
  "Warp",
  "Fractionally SizedBox",
  "Expanded, SizedBox",
  "Stack",
  "ListTile",
  "ListView.builder",
  "GridList",
  "Expansion Tile",
  "Swipe to Dismiss",
  "Reorderable List",
  "Slidable List Tile",
  "DataTable",
  "Basic Appbar",
  "Bottom AppBar & Floating Button",
  "Silver Appbar",
  "Search",
  "Backdrop",
  "Convex Appbar",
  "Tabs",
  "Dialogs",
  "Routes",
  "Navigation Drawer",
  "Bottom Sheet",
  "Bottom Tab Bar",
  "Bottom Navigation Bar",
  "Page Selector",
  "Draggable Sheet",
  "Future Builder",
  "Stream Builder(timer App)",
  "Stream Controller",
  "Hero",
  "Opacity",
  "Animated Container",
  "Animation Package",
];
