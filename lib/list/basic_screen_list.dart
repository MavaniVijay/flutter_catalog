import 'package:flutter/material.dart';

import 'collection_all_widget.dart';

List<ContainerList> list = [
  ContainerList(
    title: "Widget",
    color: Color(0xff86EFC4),
    icon: Icon(Icons.widgets),
    listWidget: listWidget,
  ),
  ContainerList(
    title: "Layouts",
    color: Color(0xffFDE38E),
    icon: Icon(Icons.dashboard_customize),
    listWidget: listLayout,
  ),
  ContainerList(
      title: "List",
      color: Color(0xffA7D8F6),
      icon: Icon(Icons.view_list),
      listWidget: listList),
  ContainerList(
      title: "Appbar",
      color: Color(0xffFDC7AD),
      icon: Icon(Icons.web_asset),
      listWidget: listAppbar),
  ContainerList(
      title: "Navigation",
      color: Color(0xff8E95FF),
      icon: Icon(Icons.amp_stories),
      listWidget: listNavigation),
  ContainerList(
      title: "Async",
      color: Color(0xff9CCC65),
      icon: Icon(Icons.timer),
      listWidget: listAsync),
  ContainerList(
      title: "Animation",
      color: Color(0xffB0BEC5),
      icon: Icon(Icons.auto_awesome),
      listWidget: listAnimation),
];
