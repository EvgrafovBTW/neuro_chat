import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:neuro_chat/screens/app_bars/chat_app_bar.dart';

class ChatTabBar extends StatefulWidget {
  final List<String> tabs;
  final List<Widget> tabViews;
  const ChatTabBar({super.key, required this.tabs, required this.tabViews});

  @override
  State<ChatTabBar> createState() => _ChatTabBarState();
}

class _ChatTabBarState extends State<ChatTabBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height),
        child: ChatAppBar(),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        children: widget.tabViews,
      ),
    );
  }
}
