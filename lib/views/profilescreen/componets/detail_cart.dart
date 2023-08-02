import 'package:flutter/material.dart';
import 'package:shopapp/consts/consts.dart';
Widget detailCart ({width , String ? count , String ? title}){
  return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                count!.text.fontFamily(bold).size(16).color(darkFontGrey).make(),
                5.heightBox,
              title!.text.color(darkFontGrey).make(),

              ],
            ).box.white.rounded.width(width).height(60).padding(
              EdgeInsets.all(4)
            ).make();

          
}