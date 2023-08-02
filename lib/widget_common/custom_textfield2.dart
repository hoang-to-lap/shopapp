import 'package:flutter/material.dart';
import 'package:shopapp/consts/colors.dart';
import 'package:shopapp/consts/consts.dart';
Widget customTextField2 (){
  return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
children: [
  
  password.text.color(redColor).size(16).fontFamily(bold).make(),
  5.heightBox,
  TextFormField(
   
    
decoration: InputDecoration(
  hintStyle: TextStyle(
    fontFamily: semibold,
    color: textfieldGrey,
  ),
  hintText: passwordHint,
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