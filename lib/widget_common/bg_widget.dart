import 'package:flutter/material.dart';
import 'package:shopapp/consts/colors.dart';
import 'package:shopapp/consts/consts.dart';

Widget bgWidget({Widget ? child}){
return Container(
  decoration: BoxDecoration(
    image: DecorationImage(image: AssetImage(imgBackground), fit: BoxFit.fill),
    
  ),
  child: child,
);
}