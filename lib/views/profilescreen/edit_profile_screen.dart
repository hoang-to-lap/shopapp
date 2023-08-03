import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/controller/profile_controller.dart';
import 'package:shopapp/widget_common/bg_widget.dart';
import 'package:shopapp/consts/consts.dart';
import 'package:shopapp/widget_common/custom_textfield.dart';
import 'package:shopapp/widget_common/our_button.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<profileController>();
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
children: [



  controller.profilePath.isEmpty ? Image.asset(imgProfile2,width: 100, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make() 
  
  : Image.file(File(controller.profilePath.value),
  width: 100,
  fit: BoxFit.cover,
  ).box.roundedFull.clip(Clip.antiAlias).make(),
  
  
  10.heightBox,
   ourButton(color: redColor, onPress: (){
controller.changeImage(context);
   },tetxColor: whiteColor,title: "Change"),
   Divider(),
   20.heightBox,
   customTextField(
    hint: nameHint,
    title: name,
    isPass: false,
   ),
   customTextField(
    hint: passwordHint,
    title: password ,
    isPass: true,
   ),
20.heightBox,
 SizedBox(
  width: context.screenWidth - 60,
   child: ourButton(color: redColor, onPress: (){
 
     },tetxColor: whiteColor,title: "Save"),
 ),

],
        ).box.white.shadowSm.padding(EdgeInsets.all(16)).margin(EdgeInsets.only(top: 50 , left: 12 , right: 12)).rounded.make(),

      ),
    );
  }
}