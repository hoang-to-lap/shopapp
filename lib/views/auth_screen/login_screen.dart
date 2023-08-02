import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/consts/consts.dart';
import 'package:shopapp/consts/list.dart';
import 'package:shopapp/controller/auth_controller.dart';
import 'package:shopapp/views/auth_screen/home_screen/home_screen.dart';
import 'package:shopapp/views/auth_screen/home_screen/home_screen_main.dart';
import 'package:shopapp/views/auth_screen/signup_screen.dart';
import 'package:shopapp/widget_common/app_logo_widget.dart';
import 'package:shopapp/widget_common/bg_widget.dart';
import 'package:shopapp/widget_common/custom_textfield.dart';
import 'package:shopapp/widget_common/our_button.dart';

import '../../widget_common/custom_textfield2.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  @override
  Widget build(BuildContext context) {


var controller = Get.put(AuthController());

    return bgWidget(child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
child: Column(children: [
   SizedBox(height: 90),
  appLogo(),
  10.heightBox,
  Text("Login to ShopApp" , style: TextStyle(fontFamily: bold , fontSize: 22 , color: Colors.white),),
  10.heightBox,
  Column(
    children: [
      //  customTextField(),
      customTextField(title: email , hint: emailHint , isPass: false , controller: controller.emailController),
       10.heightBox,
      //  customTextField2(),
      customTextField(title: password , hint: passwordHint , isPass: true , controller: controller.passwordController),
       10.heightBox,
       Align(
        alignment: Alignment.centerRight,
       child: TextButton(onPressed: (){

       }, 
       child: forgetPassword.text.make(),
       ),
      
       ),
        5.heightBox,
        // ourButton().box.width(context.screenWidth - 50).make(),
        ourButton(color: redColor ,title: login , tetxColor: Colors.white , onPress: () async
        {
         await controller.loginMethod(context: context).then((value) {
          if(value!= null){
            VxToast.show(context, msg: loginalert);
            Get.offAll(()=> const homeScreen());
          }
         });
        }).box.width(context.screenWidth - 50).make(),
        5.heightBox,
        createNewAccount.text.color(fontGrey).size(18).make(),
        5.heightBox,
         ourButton(color: golden ,title: signup , tetxColor: Colors.white , onPress: (){
           Get.to(()=> const signupScreen(),);
         }).box.width(context.screenWidth - 50).make(),
          10.heightBox,
         loginWith.text.make(),
         5.heightBox,
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: lightGrey,
              child: Image.asset(socialIconList[index],width: 30,),
            ),
          )),
         ),

    ],
  ).box.white.rounded.padding(EdgeInsets.all(15)).width(context.screenWidth-70).make(),
]),
      ),
    ));
  }
}