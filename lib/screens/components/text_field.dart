import 'package:flutter/material.dart';
import 'package:neuro_chat/decorations.dart';
import 'package:neuro_chat/logic/user_credential_cubit.dart';
import 'package:neuro_chat/screens/auth_screen.dart';
import 'package:neuro_chat/logic/user_credential_cubit.dart';
import 'package:provider/provider.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String initialValue;
  final TextFieldType textFieldType;
  // final bool isReg;
  // final SharedPreferences
  const AppTextField({
    super.key,
    required this.label,
    required this.initialValue,
    required this.textFieldType,
    // required this.isReg,
  });

  @override
  Widget build(BuildContext context) {
    UserCredentialState user = Provider.of<UserCredentialCubit>(context).state;
    valueSaved(String? value) {
      if (!value.isNull()) {
        if (textFieldType.equals(TextFieldType.log)) {
          user.login = value!;
        }
        if (textFieldType.equals(TextFieldType.email)) {
          user.email = value!;
        }
        if (textFieldType.equals(TextFieldType.psd)) {
          user.password = value!;
        }
      }
    }

    return TextFormField(
      initialValue: initialValue,
      onSaved: (newValue) => valueSaved(newValue),
      onChanged: (newValue) => valueSaved(newValue),
      obscureText: textFieldType.equals(TextFieldType.psd),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        labelText: label,
        hintText: label,
        focusedBorder: textFieldBorder,
        enabledBorder: textFieldBorder,
      ),
    );
  }
}

extension on String? {
  bool isNull() => this == null;
}

extension on TextFieldType {
  bool equals(TextFieldType type) => this == type;
}
