import 'package:flutter/material.dart';
import 'package:neuro_chat/colors.dart';
import 'package:neuro_chat/screens/components/tab_indicator.dart';

class DefaultTabBar extends StatelessWidget {
  final List<String> tabs;
  const DefaultTabBar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: authTabPrimaryColor,
      unselectedLabelColor: Color(0xFFB6B6B6),
      indicator: TabIndicator(),
      labelStyle: TextStyle(
          fontSize: 18, fontFamily: 'Roboto', fontWeight: FontWeight.w500),
      tabs: tabs.map((tab) => Tab(text: tab)).toList(),
    );
    ;
  }
}
