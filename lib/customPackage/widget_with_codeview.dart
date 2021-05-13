import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_catalogs/customPackage/source_code_view.dart';
import 'package:string_scanner/string_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../const/color.dart';

class CustomWidgetWithCodeView extends StatelessWidget {
  // Path of source file (relative to project root). The file's content will be
  // shown in the "Code" tab.
  final String sourceFilePath;
  final Widget child;
  final String codeLinkPrefix;
  final double fontSize;

  const CustomWidgetWithCodeView({
    Key key,
    @required this.child,
    @required this.sourceFilePath,
    this.codeLinkPrefix,
    this.fontSize = 15,
  }) : super(key: key);

  String get routeName => '/${this.runtimeType.toString()}';

  Widget get sourceCodeView => SourceCodeView(
        filePath: this.sourceFilePath,
        codeLinkPrefix: this.codeLinkPrefix,
        fontSize: fontSize,
      );

  static const _TABS = <Widget>[
    Tab(
      child: ListTile(
        leading: Icon(Icons.phone_android, color: Colors.white),
        title: Text('Preview', style: TextStyle(color: Colors.white)),
      ),
    ),
    Tab(
      child: ListTile(
        leading: Icon(Icons.code, color: Colors.white),
        title: Text('Code', style: TextStyle(color: Colors.white)),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _ColoredTabBar(
          color: ColorPalate.appBarColor,
          tabBar: TabBar(
            tabs: _TABS,
            indicatorColor: Colors.blueGrey,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _AlwaysAliveWidget(child: this.child),
            _AlwaysAliveWidget(child: this.sourceCodeView),
          ],
        ),
      ),
    );
  }
}

// This widget is always kept alive, so that when tab is switched back, its
// child's state is still preserved.
class _AlwaysAliveWidget extends StatefulWidget {
  final Widget child;

  const _AlwaysAliveWidget({Key key, @required this.child}) : super(key: key);

  @override
  _AlwaysAliveWidgetState createState() => _AlwaysAliveWidgetState();
}

class _AlwaysAliveWidgetState extends State<_AlwaysAliveWidget>
    with AutomaticKeepAliveClientMixin<_AlwaysAliveWidget> {
  @override
  Widget build(BuildContext context) {
    super.build(context); // This build method is annotated "@mustCallSuper".
    return this.widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}

class _ColoredTabBar extends Container implements PreferredSizeWidget {
  final Color color;
  final TabBar tabBar;

  _ColoredTabBar({Key key, @required this.color, @required this.tabBar})
      : super(key: key);

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Material(
        elevation: 0.0,
        color: color,
        child: tabBar,
      );
}
