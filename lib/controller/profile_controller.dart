import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopapp/consts/consts.dart';
import 'package:path/path.dart';

class profileController extends GetxController {
  var profilePath = ''.obs;
var profileImageLink = '';
var isloading = false.obs ;

var nameController = TextEditingController();
var passController = TextEditingController();

  changeImage(context) async {
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70);
    if(img==null) return;
    profilePath.value = img.path ;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
      
    }
  }

  uploadProfileImage() async{
    var filename = basename(profilePath.value);
    var destianation = 'image/${currentUser!.uid}/filename';
    Reference ref = FirebaseStorage.instance.ref().child(destianation);
    await ref.putFile(File(profilePath.value));
    profileImageLink = await ref.getDownloadURL();
  }

  updateProfile({name , password , imageUrl}) async {
    var store = firestore.collection(userCollection).doc(currentUser!.uid);
  await  store.set({
      'name' : name ,
      'password' : password , 
      'imageUrl' : imageUrl ,

    }, SetOptions(merge: true));
    isloading(false);
  }
}