import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:neuro_chat/screens/slides/auth_slides/auth_tab_bar.dart';
import 'package:neuro_chat/screens/slides/auth_slides/register_slide.dart';
import 'package:neuro_chat/screens/slides/auth_slides/sign_in_slider.dart';
import 'package:neuro_chat/services/database_helper.dart';
import 'package:provider/provider.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  late DatabaseHelper db;
  @override
  void initState() {
    db = DatabaseHelper.instance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthTabBar(
        tabs: ['Log In', 'Sign Up'],
        tabViews: <Widget>[
          SignIn(),
          Register(),
        ],
      ),
    );
  }
}

enum TextFieldType { log, psd, email }
