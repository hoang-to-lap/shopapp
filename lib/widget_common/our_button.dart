import 'package:flutter/material.dart';
import 'package:shopapp/consts/colors.dart';
import 'package:shopapp/consts/consts.dart';

Widget ourButton({onPress, color , tetxColor ,  String ? title}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color,
      padding: EdgeInsets.all(12),
    ),
    onPressed: onPress,
     child: title!.text.white.fontFamily(bold).make(),);
}