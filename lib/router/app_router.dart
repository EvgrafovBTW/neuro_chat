import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neuro_chat/screens/auth_screen.dart';
import 'package:neuro_chat/screens/chat_screen.dart';

class AppRouter {
  Route onGeneratRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: ((context) => const Auth()));
      case '/main':
        return MaterialPageRoute(builder: ((context) => const ChatScreen()));

      default:
        return MaterialPageRoute(builder: ((context) => Scaffold()));
    }
  }
}
