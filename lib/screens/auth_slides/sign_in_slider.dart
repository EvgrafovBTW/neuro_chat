import 'package:flutter/material.dart';
import 'package:neuro_chat/colors.dart';
import 'package:neuro_chat/logic/user_credential_cubit.dart';
import 'package:neuro_chat/screens/auth_screen.dart';
import 'package:neuro_chat/screens/components/text_field.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  String? login;
  String? password;

  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late UserCredentialState user;
  @override
  void initState() {
    user = Provider.of<UserCredentialCubit>(context, listen: false).state;
    super.initState();
  }

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
                  'Log In to continue',
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
                AppTextField(
                  label: 'Login',
                  initialValue: '',
                  textFieldType: TextFieldType.log,
                ),
                AppTextField(
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
                  onTap: () {
                    if (user.login != '' && user.password != '') {
                      Navigator.pushNamed(context, '/main');
                    }
                  },
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
