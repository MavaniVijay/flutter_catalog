import 'package:flutter/material.dart';
import 'package:flutter_catalogs/all_widgets/animation/animated_container_widget.dart';
import 'package:flutter_catalogs/all_widgets/animation/animated_icon_widget.dart';
import 'package:flutter_catalogs/all_widgets/animation/animation_package_widget.dart';
import 'package:flutter_catalogs/all_widgets/animation/hero_widget.dart';
import 'package:flutter_catalogs/all_widgets/animation/opacity_widget.dart';
import 'package:flutter_catalogs/all_widgets/appbar/backdrop_widget.dart';
import 'package:flutter_catalogs/all_widgets/appbar/basic_appbar_widget.dart';
import 'package:flutter_catalogs/all_widgets/appbar/bottom_appbar_widget.dart';
import 'package:flutter_catalogs/all_widgets/appbar/convex_appbar_widget.dart';
import 'package:flutter_catalogs/all_widgets/appbar/search_widget.dart';
import 'package:flutter_catalogs/all_widgets/appbar/silver_appbar_widget.dart';
import 'package:flutter_catalogs/all_widgets/async/future_builder_widget.dart';
import 'package:flutter_catalogs/all_widgets/async/stream_builder_widget.dart';
import 'package:flutter_catalogs/all_widgets/async/stream_controller_widget.dart';
import 'package:flutter_catalogs/all_widgets/layouts/container_widget.dart';
import 'package:flutter_catalogs/all_widgets/layouts/expanded_box_widget.dart';
import 'package:flutter_catalogs/all_widgets/layouts/fractionally_widget.dart';
import 'package:flutter_catalogs/all_widgets/layouts/row_column_widget.dart';
import 'package:flutter_catalogs/all_widgets/layouts/stack_widget.dart';
import 'package:flutter_catalogs/all_widgets/layouts/warp_widget.dart';
import 'package:flutter_catalogs/all_widgets/list/data_table_widget.dart';
import 'package:flutter_catalogs/all_widgets/list/expansiontile_widget.dart';
import 'package:flutter_catalogs/all_widgets/list/gridlist_widget.dart';
import 'package:flutter_catalogs/all_widgets/list/list_title_widget.dart';
import 'package:flutter_catalogs/all_widgets/list/listview_builder_widget.dart';
import 'package:flutter_catalogs/all_widgets/list/reorderable_list_widget.dart';
import 'package:flutter_catalogs/all_widgets/list/slidable_list_title_widget.dart';
import 'package:flutter_catalogs/all_widgets/list/swapie_dismiss_widget.dart';
import 'package:flutter_catalogs/all_widgets/navigation/bottom_navigation_widget.dart';
import 'package:flutter_catalogs/all_widgets/navigation/bottom_sheet_widget.dart';
import 'package:flutter_catalogs/all_widgets/navigation/bottom_tabbar_widget.dart';
import 'package:flutter_catalogs/all_widgets/navigation/dialog_widget.dart';
import 'package:flutter_catalogs/all_widgets/navigation/drggable_sheet_widget.dart';
import 'package:flutter_catalogs/all_widgets/navigation/navigation_drawer_widget.dart';
import 'package:flutter_catalogs/all_widgets/navigation/page_selector_widget.dart';
import 'package:flutter_catalogs/all_widgets/navigation/routes_widget.dart';
import 'package:flutter_catalogs/all_widgets/navigation/tab_widget.dart';
import 'package:flutter_catalogs/all_widgets/widget/button_widget.dart';
import 'package:flutter_catalogs/all_widgets/widget/card_response_widget.dart';
import 'package:flutter_catalogs/all_widgets/widget/dropdown_menu_widget.dart';
import 'package:flutter_catalogs/all_widgets/widget/gradiant_widget.dart';
import 'package:flutter_catalogs/all_widgets/widget/icon_widget.dart';
import 'package:flutter_catalogs/all_widgets/widget/image_filterd_widget.dart';
import 'package:flutter_catalogs/all_widgets/widget/image_widget.dart';
import 'package:flutter_catalogs/all_widgets/widget/other_stateful_widget.dart';
import 'package:flutter_catalogs/all_widgets/widget/row_column_widget.dart';
import 'package:flutter_catalogs/all_widgets/widget/text_filed_widget.dart';
import 'package:flutter_catalogs/all_widgets/widget/text_widget.dart';
import 'package:flutter_catalogs/all_widgets/widget/textformfiled_widget.dart';
import 'package:flutter_catalogs/model/homeCardModel.dart';
import 'package:flutter_catalogs/model/widgetBoxModel.dart';

/// screen size...
const double kTabletSize = 1000;
const double kMobileSize = 550;

/// basic tab screen.basic_tab.widget list...
List<HomeCardModel> kBasicTabList = [
  HomeCardModel(
    title: "Widget",
    color: Color(0xff86EFC4),
    icon: Icons.widgets,
    listWidget: kListWidgets,
  ),
  HomeCardModel(
    title: "Layouts",
    color: Color(0xffFDE38E),
    icon: Icons.dashboard_customize,
    listWidget: kListLayouts,
  ),
  HomeCardModel(
      title: "List",
      color: Color(0xffA7D8F6),
      icon: Icons.view_list,
      listWidget: kListList),
  HomeCardModel(
      title: "Appbar",
      color: Color(0xffFDC7AD),
      icon: Icons.web_asset,
      listWidget: kListAppbar),
  HomeCardModel(
      title: "Navigation",
      color: Color(0xff8E95FF),
      icon: Icons.amp_stories,
      listWidget: kListNavigation),
  HomeCardModel(
      title: "Async",
      color: Color(0xff9CCC65),
      icon: Icons.timer,
      listWidget: kListAsync),
  HomeCardModel(
      title: "Animation",
      color: Color(0xffB0BEC5),
      icon: Icons.auto_awesome,
      listWidget: kListAnimation),
];

/// widgets list....
List<WidgetBoxModel> kListWidgets = [
  WidgetBoxModel(
    title: "Icon",
    color: Color(0xff1b5e20),
  ),
  WidgetBoxModel(
    title: "Text",
    color: Color(0xff2e7d32),
  ),
  WidgetBoxModel(
    title: "TextFiled",
    color: Color(0xff388e3c),
  ),
  WidgetBoxModel(
    title: "Image",
    color: Color(0xff43a047),
  ),
  WidgetBoxModel(
    title: "Card,InkResponse",
    color: Color(0xff4caf50),
  ),
  WidgetBoxModel(
    title: "Gradient",
    color: Color(0xff4caf50),
  ),
  WidgetBoxModel(
    title: "Buttons",
    color: Color(0xff43a047),
  ),
  WidgetBoxModel(
    title: "Dropdown & Menu Button",
    color: Color(0xff388e3c),
  ),
  WidgetBoxModel(
    title: "TextFormFiled",
    color: Color(0xff2e7d32),
  ),
  WidgetBoxModel(
    title: "Other Stateful Widgets",
    color: Color(0xff1b5e20),
  ),
];

/// layouts List...
List<WidgetBoxModel> kListLayouts = [
  WidgetBoxModel(
    title: "Container",
    color: Color(0xfff57f17),
  ),
  WidgetBoxModel(
    title: "Row,Column",
    color: Color(0xfff9a825),
  ),
  WidgetBoxModel(
    title: "Warp",
    color: Color(0xfffbc02d),
  ),
  WidgetBoxModel(
    title: "Fractionally SizedBox",
    color: Color(0xfffdd835),
  ),
  WidgetBoxModel(
    title: "Expanded, SizedBox",
    color: Color(0xffffeb3b),
  ),
  WidgetBoxModel(
    title: "Stack",
    color: Color(0xffffee58),
  ),
];

/// Lists List...
List<WidgetBoxModel> kListList = [
  WidgetBoxModel(
    title: "ListTile",
    color: Color(0xff01579b),
  ),
  WidgetBoxModel(
    title: "ListView.builder",
    color: Color(0xff0277bd),
  ),
  WidgetBoxModel(
    title: "GridList",
    color: Color(0xff0288d1),
  ),
  WidgetBoxModel(
    title: "Expansion Tile",
    color: Color(0xff039be5),
  ),
  WidgetBoxModel(
    title: "Swipe to Dismiss",
    color: Color(0xff03a9f4),
  ),
  WidgetBoxModel(
    title: "Reorderable List",
    color: Color(0xff29b6f6),
  ),
  WidgetBoxModel(
    title: "Slidable List Tile",
    color: Color(0xff4fc3f7),
  ),
  WidgetBoxModel(
    title: "DataTable",
    color: Color(0xff81d4fa),
  ),
];

/// Appbar List...
List<WidgetBoxModel> kListAppbar = [
  WidgetBoxModel(
    title: "Basic Appbar",
    color: Color(0xffbf360c),
  ),
  WidgetBoxModel(
    title: "Bottom AppBar & Floating Button",
    color: Color(0xffd84315),
  ),
  WidgetBoxModel(
    title: "Silver Appbar",
    color: Color(0xffe64a19),
  ),
  WidgetBoxModel(
    title: "Search",
    color: Color(0xfff4511e),
  ),
  WidgetBoxModel(
    title: "Backdrop",
    color: Color(0xffff5722),
  ),
  WidgetBoxModel(
    title: "Convex Appbar",
    color: Color(0xffff7043),
  ),
];

/// Navigation List...
List<WidgetBoxModel> kListNavigation = [
  WidgetBoxModel(
    title: "Tabs",
    color: Color(0xff311b92),
  ),
  WidgetBoxModel(
    title: "Dialogs",
    color: Color(0xff4527a0),
  ),
  WidgetBoxModel(
    title: "Routes",
    color: Color(0xff512da8),
  ),
  WidgetBoxModel(
    title: "Navigation Drawer",
    color: Color(0xff5e35b1),
  ),
  WidgetBoxModel(
    title: "Bottom Sheet",
    color: Color(0xff673ab7),
  ),
  WidgetBoxModel(
    title: "Bottom Tab Bar",
    color: Color(0xff673ab7),
  ),
  WidgetBoxModel(
    title: "Bottom Navigation Bar",
    color: Color(0xff5e35b1),
  ),
  WidgetBoxModel(
    title: "Page Selector",
    color: Color(0xff512da8),
  ),
  WidgetBoxModel(
    title: "Draggable Sheet",
    color: Color(0xff4527a0),
  ),
];

/// Async List...
List<WidgetBoxModel> kListAsync = [
  WidgetBoxModel(
    title: "Future Builder",
    color: Color(0xff33691e),
  ),
  WidgetBoxModel(
    title: "Stream Builder(timer App)",
    color: Color(0xff558b2f),
  ),
  WidgetBoxModel(
    title: "Stream Controller",
    color: Color(0xff689f38),
  ),
];

/// Animation List...
List<WidgetBoxModel> kListAnimation = [
  WidgetBoxModel(
    title: "Hero",
    color: Color(0xff424242),
  ),
  WidgetBoxModel(
    title: "Opacity",
    color: Color(0xff616161),
  ),
  WidgetBoxModel(
    title: "Animated Container",
    color: Color(0xff757575),
  ),
  WidgetBoxModel(
    title: "Animation Package",
    color: Color(0xff9e9e9e),
  ),
];

/// collectionListWidget...
List<String> kCollectionListWidget = [
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

/// preview screen dart path...
/// Basic Screen in Multiple Widget ///
const String basePath = "lib/all_widgets/";
const String widgetPath = "widget/";
const String layoutPath = "layouts/";
const String listPath = "list/";
const String appbarPath = "appbar/";
const String navigationPath = "navigation/";
const String asyncPath = "async/";
const String animationPath = "animation/";

const Map<String, String> kWidgetList = {
  /// Widget Container ////
  'Icon': "${basePath}${widgetPath}icon_widget.dart",
  'Text': "${basePath}${widgetPath}text_widget.dart",
  'RowColumn': "${basePath}${widgetPath}row_column_widget.dart",
  'TextFiled': "${basePath}${widgetPath}text_filed_widget.dart",
  'Image': "${basePath}${widgetPath}image_widget.dart",
  'Card,InkResponse': "${basePath}${widgetPath}card_response_widget.dart",
  'Gradient': "${basePath}${widgetPath}gradiant_widget.dart",
  'Buttons': "${basePath}${widgetPath}button_widget.dart",
  'Dropdown & Menu Button': "${basePath}${widgetPath}dropdown_menu_widget.dart",
  'TextFormFiled': "${basePath}${widgetPath}textformfiled_widget.dart",
  'ImageFiltered': "${basePath}${widgetPath}image_filterd_widget.dart",
  'Other Stateful Widgets':
      "${basePath}${widgetPath}other_stateful_widget.dart",

  /// Layout Container ///
  'Container': "${basePath}${layoutPath}container_widget.dart",
  'Row,Column': "${basePath}${layoutPath}row_column_widget.dart",
  'Warp': "${basePath}${layoutPath}warp_widget.dart",
  'Fractionally SizedBox': "${basePath}${layoutPath}fractionally_widget.dart",
  'Expanded, SizedBox': "${basePath}${layoutPath}expanded_box_widget.dart",
  'Stack': "${basePath}${layoutPath}stack_widget.dart",
  //// List Container ////
  'ListTile': "${basePath}${listPath}list_title_widget.dart",
  'ListView.builder': "${basePath}${listPath}listview_builder_widget.dart",
  'GridList': "${basePath}${listPath}gridlist_widget.dart",
  'Expansion Tile': "${basePath}${listPath}expansiontile_widget.dart",
  'Swipe to Dismiss': "${basePath}${listPath}swapie_dismiss_widget.dart",
  'Reorderable List': "${basePath}${listPath}reorderable_list_widget.dart",
  'Slidable List Tile': "${basePath}${listPath}slidable_list_title_widget.dart",
  'DataTable': "${basePath}${listPath}data_table_widget.dart",

  /// AppBar Container ///
  'Basic Appbar': "${basePath}${appbarPath}basic_appbar_widget.dart",
  'Bottom AppBar & Floating Button':
      "${basePath}${appbarPath}bottom_appbar_widget.dart",
  'Silver Appbar': "${basePath}${appbarPath}silver_appbar_widget.dart",
  'Search': "${basePath}${appbarPath}search_widget.dart",
  'Backdrop': "${basePath}${appbarPath}backdrop_widget.dart",
  'Convex Appbar': "${basePath}${appbarPath}convex_appbar_widget.dart",

  /// Navigation Container ///
  'Tabs': "${basePath}${navigationPath}tab_widget.dart",
  'Dialogs': "${basePath}${navigationPath}dialog_widget.dart",
  'Routes': "${basePath}${navigationPath}routes_widget.dart",
  'Navigation Drawer':
      "${basePath}${navigationPath}navigation_drawer_widget.dart",
  'Bottom Sheet': "${basePath}${navigationPath}bottom_sheet_widget.dart",
  'Bottom Tab Bar': "${basePath}${navigationPath}bottom_tabbar_widget.dart",
  'Bottom Navigation Bar':
      "${basePath}${navigationPath}bottom_navigation_widget.dart",
  'Page Selector': "${basePath}${navigationPath}page_selector_widget.dart",
  'Draggable Sheet': "${basePath}${navigationPath}drggable_sheet_widget.dart",

  /// Async Container ///
  'Future Builder': "${basePath}${asyncPath}future_builder_widget.dart",
  'Stream Controller': "${basePath}${asyncPath}stream_controller_widget.dart",
  'Stream Builder(timer App)':
      "${basePath}${asyncPath}stream_builder_widget.dart",

  /// Animation Container ///
  'Hero': "${basePath}${animationPath}hero_widget.dart",
  'Opacity': "${basePath}${animationPath}opacity_widget.dart",
  'Animated Icon': "${basePath}${animationPath}animated_icon_widget.dart",
  'Animated Container':
      "${basePath}${animationPath}animated_container_widget.dart",
  'Animation Package':
      "${basePath}${animationPath}animation_package_widget.dart",
};

/// preview screen dart File class...
Widget kGetWidgetClass(String title) {
  //// Widget Container ///
  if (title == 'Icon') {
    return IconScreen();
  } else if (title == 'Text') {
    return TextWidget();
  } else if (title == 'RowColumn') {
    return RowColumn();
  } else if (title == 'TextFiled') {
    return TextFieldExample();
  } else if (title == 'Image') {
    return ImageWidget();
  } else if (title == 'Card,InkResponse') {
    return CardInkResponseWidget();
  } else if (title == 'Gradient') {
    return GradientWidget();
  } else if (title == 'Buttons') {
    return ButtonsWidget();
  } else if (title == 'Dropdown & Menu Button') {
    return DropdownButtonWidget();
  } else if (title == 'TextFormFiled') {
    return TextFormFieldWidget();
  } else if (title == 'ImageFiltered') {
    return ImageFilteredWidget();
  } else if (title == 'Other Stateful Widgets') {
    return StatefulWidgetsWidget();

    /// Layout Container ///
  } else if (title == 'Container') {
    return ContainerWidget();
  } else if (title == 'Row,Column') {
    return RowColExample();
  } else if (title == 'Warp') {
    return WrapExample();
  } else if (title == 'Fractionally SizedBox') {
    return FractionallySizedBoxExample();
  } else if (title == 'Expanded, SizedBox') {
    return ExpandedExample();
  } else if (title == 'Stack') {
    return StackExample();
  }

  /// Layout Container ///
  else if (title == 'ListTile') {
    return ListTileExample();
  } else if (title == 'ListView.builder') {
    return ListViewBuilderExample();
  } else if (title == 'GridList') {
    return GridListExample();
  } else if (title == 'Expansion Tile') {
    return ExpansionTileExample();
  } else if (title == 'Swipe to Dismiss') {
    return ListSwipeToDismissExample();
  } else if (title == 'Reorderable List') {
    return ReorderableListExample();
  } else if (title == 'Slidable List Tile') {
    return SlidableTileExample();
  } else if (title == 'DataTable') {
    return DataTableExample();
  }

  /// AppBar Container ///
  else if (title == 'Basic Appbar') {
    return BasicAppbarExample();
  } else if (title == 'Bottom AppBar & Floating Button') {
    return BottomAppbarExample();
  } else if (title == 'Silver Appbar') {
    return SliverAppBarExample();
  } else if (title == 'Search') {
    return AppBarSearchExample();
  } else if (title == 'Backdrop') {
    return BackdropExample();
  } else if (title == 'Convex Appbar') {
    return ConvexAppExample();

    /// Navigation Container ///
  } else if (title == 'Tabs') {
    return TabsExample();
  } else if (title == 'Dialogs') {
    return DialogsExample();
  } else if (title == 'Routes') {
    return RoutesExample();
  } else if (title == 'Navigation Drawer') {
    return NavDrawerExample();
  } else if (title == 'Bottom Sheet') {
    return BottomSheetExample();
  } else if (title == 'Bottom Tab Bar') {
    return BottomTabbarExample();
  } else if (title == 'Bottom Navigation Bar') {
    return BottomNavigationBarExample();
  } else if (title == 'Page Selector') {
    return PageSelectorExample();
  } else if (title == 'Draggable Sheet') {
    return DraggableScrollableSheetExample();
  }

  /// Async Container ///
  else if (title == 'Future Builder') {
    return FutureBuilderExample();
  } else if (title == 'Stream Builder(timer App)') {
    return StreamBuilderExample();
  } else if (title == 'Stream Controller') {
    return StreamControllerExample();
  }

  /// Animation Container ///
  else if (title == 'Hero') {
    return HeroExample();
  } else if (title == 'Opacity') {
    return OpacityExample();
  } else if (title == 'Animated Icon') {
    return AnimatedIconsExample();
  } else if (title == 'Animated Container') {
    return AnimatedContainerExample();
  } else if (title == 'Animation Package') {
    return AnimationsPackageExample();
  } else {
    return Center(
      child: Text("No Data Found"),
    );
  }
}
