import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/consts/consts.dart';
import 'package:shopapp/consts/list.dart';
import 'package:shopapp/controller/auth_controller.dart';
import 'package:shopapp/views/auth_screen/login_screen.dart';
import 'package:shopapp/views/profilescreen/componets/detail_cart.dart';
import 'package:shopapp/widget_common/bg_widget.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(child: Column(children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: const Icon(Icons.edit , color: whiteColor,)).onTap(() {
                
              },),
          ),

          //edit profile button


          //User detail section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0),
            child: Row(
              children: [
                Image.asset(imgProfile2,width: 100, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                10.widthBox,
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children:[
                    "Name user".text.fontFamily(semibold).white.make(),
                    5.heightBox,
                    "customer@gmail.com".text.white.make(),
          
                ] ,)),
                OutlinedButton(
                  
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: whiteColor,
          
                    )
                  ),
                  onPressed: () async{

                    await Get.put(AuthController()).signoutMethod(context: context);
                    Get.offAll(() => LoginScreen());
                  }, child: logout.text.fontFamily(semibold).white.make())
          
              ],
            ),
          ),
          5.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
  detailCart(count: "00" , title: "in your cart" , width: context.screenWidth/3.4),
  detailCart(count: "32" , title: "in your wishlist" , width: context.screenWidth/3.4),
  detailCart(count: "55" , title: " your orders" , width: context.screenWidth/3.4),
],
          ),

          //button section

          ListView.separated(
            shrinkWrap: true, 
            separatorBuilder: (context, index) {
              return Divider(
                color: lightGrey,
              );
            },
             itemCount: profileButtonList.length, itemBuilder : (BuildContext , int index){
            return ListTile(
              title: "${profileButtonList[index]}".text.fontFamily(semibold).color(darkFontGrey).make(),
              leading: Image.asset(proflieButtonIcon[index] , width: 22,),
            );
          }).box.white.rounded.margin(EdgeInsets.all(12)).padding(EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make()

        ])),
      ),
    );
  }
}