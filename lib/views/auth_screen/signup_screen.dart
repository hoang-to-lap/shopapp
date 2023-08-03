import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/consts/consts.dart';
import 'package:shopapp/controller/auth_controller.dart';
import 'package:shopapp/views/auth_screen/home_screen/home_screen.dart';

import '../../consts/list.dart';
import '../../widget_common/app_logo_widget.dart';
import '../../widget_common/bg_widget.dart';
import '../../widget_common/custom_textfield.dart';
import '../../widget_common/our_button.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {

  bool? isCheck = false;
  var controller = Get.put(AuthController());

  //test controller
  var nameController = TextEditingController();
  var emailController = TextEditingController();
   var passwordController= TextEditingController();

 

 var repasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return bgWidget(child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
child: Column(children: [
   SizedBox(height: 90),
  appLogo(),
  10.heightBox,
  Text("Sign up to ShopApp" , style: TextStyle(fontFamily: bold , fontSize: 22 , color: Colors.white),),
  5.heightBox,
  Obx( ()=> Column(
      children: [
        customTextField(title: name , hint: nameHint , controller: nameController , isPass: false),
        5.heightBox,
        customTextField(title: email , hint: emailHint , controller: emailController , isPass: false),
         5.heightBox,
        //  customTextField2(),
        customTextField(title: password , hint: passwordHint , controller: passwordController ,isPass: true),
        5.heightBox,
         customTextField(title: retypePassword , hint: retypePassword ,  controller: repasswordController ,isPass: true),
        //  10.heightBox,
        //  Align(
        //   alignment: Alignment.centerRight,
        //  child: TextButton(onPressed: (){
  
        //  }, 
        //  child: forgetPassword.text.make(),
        //  ),
        
        //  ),
          5.heightBox,
          // ourButton().box.width(context.screenWidth - 50).make(),
         
        Row(
          children: [
            Checkbox(
              checkColor: redColor,
              value: isCheck, onChanged: (newvallue){
                
                setState(() {
                   isCheck = newvallue;
                });
               
            },
            ),
            10.widthBox,
            Expanded(
              child:  RichText(text: TextSpan(
            children: [
              TextSpan(
                text: " I agree with" , style: TextStyle(
                  fontFamily: bold,
                  color: fontGrey,
                ),
              ),
                TextSpan(
                text: term, style: TextStyle(
                  fontFamily: bold,
                  fontWeight: FontWeight.w600,
                  color: redColor,
                ),
              ),
                TextSpan(
                text: " & " , style: TextStyle(
                  fontFamily: bold,
                  color: fontGrey,
                ),
              ),
                TextSpan(
                text: policy , style: TextStyle(
                  fontFamily: bold,
                  fontWeight: FontWeight.w600,
                  color: redColor,
                ),
              ),
            ]
              ),),
            )
          ],
        ),
      controller.isloading.value ? CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(redColor),
      )  :   ourButton( color: isCheck== true ? redColor : fontGrey  ,title: signup , 
          tetxColor: Colors.white , onPress: () async{
  if(isCheck != false){
    controller.isloading(true);
    try {
      await controller.signupMethod(context: context , email: emailController.text , password: passwordController.text).then((value) {
  
        return controller.storeUserData(
          email: emailController.text,
          password:  passwordController.text,
          name: nameController.text,
        );
      }).then((value) {
        VxToast.show(context, msg: loginalert);
        Get.offAll(() => homeScreen());
      });
    } catch (e) {
      auth.signOut();
      VxToast.show(context, msg: e.toString());
      controller.isloading(false);
      
    }
  }
  
          } ,).box.width(context.screenWidth - 50).make(),
          5.heightBox,
          RichText(text: TextSpan(
            children: [
              TextSpan(
  text: alreadyHaveAccount,
  style: TextStyle(
    color: fontGrey,
    fontFamily: bold,
  )
              ),
               TextSpan(
  text: login,
  style: TextStyle(
    color: redColor,
    fontFamily: bold,
  )
              ),
            ],
          ),
          ).onTap(() {
            Get.back();
          }),
      ],
    ).box.white.rounded.padding(EdgeInsets.all(15)).width(context.screenWidth-70).make(),
  ),

]),
      ),
    ));
  }
}