import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/consts/consts.dart';
import 'package:shopapp/views/auth_screen/home_screen/home_screen.dart';
import 'package:shopapp/views/auth_screen/login_screen.dart';
import 'package:shopapp/widget_common/app_logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //Change Screen after 3s
  changeScreen(){
    Future.delayed(Duration(seconds: 3),(){
// Get.to(()=> const LoginScreen());
auth.authStateChanges().listen((User ? user) {

  if(user == null && mounted){
Get.to(()=> LoginScreen());
  }else {
    Get.to(()=> homeScreen());
  }
 });
    });
      }
void initState(){
  changeScreen();
  super.initState();
}

  @override

  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.red.shade600,
body: Center(
  child: Column(
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: Image.asset(icSplashBg , width: 300,
        ),
  
        ),
        SizedBox(height: 20,),
        appLogo(),
        10.heightBox,
        appname.text.fontFamily(bold).size(22).white.make(),
        const Spacer(),
        credits.text.white.fontFamily(bold).make(),
        30.heightBox,

    ],
    ),
    ),

    );
  }
}