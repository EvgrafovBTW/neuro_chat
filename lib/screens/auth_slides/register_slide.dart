// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:neuro_chat/colors.dart';
import 'package:neuro_chat/screens/auth_screen.dart';
import 'package:neuro_chat/screens/components/text_field.dart';

class Register extends StatefulWidget {
  String? login;
  String? password;
  String? email;
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? login2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Align(
                    alignment: FractionalOffset.center,
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                          color: authTabPrimaryColor,
                          fontFamily: 'mohave',
                          fontSize: 40,
                          fontWeight: FontWeight.w500),
                    )),
                flex: 3,
              ),
              Expanded(
                child: Text(
                  'Sign Up to continue',
                  style: TextStyle(color: Colors.black45, fontSize: 20),
                ),
                flex: 2,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Wrap(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              runSpacing: 8,
              children: [
                const AppTextField(
                  label: 'Login',
                  initialValue: '',
                  textFieldType: TextFieldType.log,
                ),
                const AppTextField(
                  label: 'Email',
                  initialValue: '',
                  textFieldType: TextFieldType.email,
                ),
                const AppTextField(
                  label: 'Password',
                  initialValue: '',
                  textFieldType: TextFieldType.psd,
                ),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    width: 300,
                    height: 80,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              appPrimaryColor,
                              Colors.indigo.withOpacity(.5)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ))
      ],
    );
  }
}
