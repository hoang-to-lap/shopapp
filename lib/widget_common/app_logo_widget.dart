import 'package:flutter/widgets.dart';
import 'package:shopapp/consts/colors.dart';
import 'package:shopapp/consts/consts.dart';
Widget appLogo(){
  return Image.asset(icAppLogo).box.white.size(77, 77).padding(EdgeInsets.all(8)).rounded.make();
}