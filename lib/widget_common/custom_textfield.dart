import 'package:flutter/material.dart';
import 'package:shopapp/consts/colors.dart';
import 'package:shopapp/consts/consts.dart';
Widget customTextField ({String ? title , String ? hint , controller , isPass}){
  return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
children: [
  
  title!.text.color(redColor).size(16).fontFamily(bold).make(),
  5.heightBox,
  TextFormField(
    obscureText: isPass,
    controller: controller,
   
    
decoration: InputDecoration(
  hintStyle: TextStyle(
    fontFamily: semibold,
    color: textfieldGrey,
  ),
  hintText: hint,
  isDense: true,
  fillColor: lightGrey,
  filled: true,
  border: InputBorder.none,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
color: redColor,
    ),
  )
),
  ),
],
  );
}