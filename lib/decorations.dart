import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neuro_chat/colors.dart';

const BoxDecoration tabDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(25),
    bottomRight: Radius.circular(25),
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 16,
      offset: Offset(0, 4),
    )
  ],
);

OutlineInputBorder textFieldBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: BorderSide(color: appPrimaryColor.withOpacity(.5), width: 1),
);
