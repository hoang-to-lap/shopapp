import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopapp/consts/consts.dart';

class profileController extends GetxController {
  var profilePath = ''.obs;


  changeImage(context) async {
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70);
    if(img==null) return;
    profilePath.value = img.path ;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
      
    }
  }
}