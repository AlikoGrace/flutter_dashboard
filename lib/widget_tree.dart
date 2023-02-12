import 'package:dashboard/app_bar.dart';
import 'package:dashboard/drawer_page.dart';
import 'package:dashboard/panel_center_page.dart';
import 'package:dashboard/panel_left_page.dart';
import 'package:dashboard/panel_right_page.dart';
import 'package:dashboard/responsive_layout.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context)
            ? Container()
            : AppBarWidget()),
        preferredSize: Size(double.infinity, 100),
      ),
      body: ResponsiveLayout(
          tiny: Container(),
          phone: PanelCenterPage(),
          tablet: Row(
            children: [
              Expanded(
                child: PanelLeftPage(),
              ),
              Expanded(child: PanelCenterPage())
            ],
          ),
          largeTablet: Row(
            children: [
              Expanded(child: PanelLeftPage()),
              Expanded(child: PanelCenterPage()),
              Expanded(child: PanelRightPage())
            ],
          ),
          computer: Row(
            children: [
              Expanded(child: DrawerPage()),
              Expanded(child: PanelLeftPage()),
              Expanded(child: PanelCenterPage()),
              Expanded(child: PanelRightPage())
            ],
          )),
      drawer: DrawerPage(),
    );
  }
}
