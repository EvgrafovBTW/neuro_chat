import 'package:flutter/material.dart';
import 'package:neuro_chat/decorations.dart';
import 'package:neuro_chat/screens/components/tab_bar.dart';

class AuthTabBar extends StatefulWidget {
  final List<String> tabs;
  final List<Widget> tabViews;
  const AuthTabBar({super.key, required this.tabs, required this.tabViews});

  @override
  State<AuthTabBar> createState() => _AuthTabBarState();
}

class _AuthTabBarState extends State<AuthTabBar> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController =
        TabController(length: widget.tabs.length, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height),
          child: Container(
            height: 90,
            decoration: tabDecoration,
            padding: const EdgeInsets.only(top: 20),
            child: DefaultTabBar(
              tabs: widget.tabs,
            ),
          ),
        ),
        body: TabBarView(
          // controller: tabController,
          physics: const BouncingScrollPhysics(),
          children: widget.tabViews,
        ),
      ),
    );
  }
}
