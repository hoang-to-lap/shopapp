import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/consts/consts.dart';
import 'package:shopapp/consts/list.dart';
import 'package:shopapp/controller/auth_controller.dart';
import 'package:shopapp/controller/profile_controller.dart';
import 'package:shopapp/service/firestore_service.dart';
import 'package:shopapp/views/auth_screen/login_screen.dart';
import 'package:shopapp/views/profilescreen/componets/detail_cart.dart';
import 'package:shopapp/views/profilescreen/edit_profile_screen.dart';
import 'package:shopapp/widget_common/bg_widget.dart';

class profileScreen extends StatelessWidget {

  
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(profileController());
    return bgWidget(
      child: Scaffold(
        body: StreamBuilder(
          stream: fireStoreService.getUser(currentUser!.uid),
          builder: (BuildContext context , AsyncSnapshot<QuerySnapshot> snapshot){

if(!snapshot.hasData){
  return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(redColor),),);
}
else{
 var data = snapshot.data!.docs[0] ; 

 return  SafeArea(child: Column(children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,


              child: const Icon(Icons.edit , color: whiteColor,)).onTap(() {


                controller.nameController.text = data['name'];
                controller.passController.text = data['password'];
                Get.to(()=> EditProfileScreen(data: data,));
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
                    "${data['name']}".text.fontFamily(semibold).white.make(),
                    5.heightBox,
                  //  "${data['email']}".text.white.make(),
          
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
  detailCart(count: data['cart_count'] , title: "in your cart" , width: context.screenWidth/3.4),
  detailCart(count: data['wishlish_count'] , title: "in your wishlist" , width: context.screenWidth/3.4),
  detailCart(count: data['order_count'] , title: " your orders" , width: context.screenWidth/3.4),
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

        ]));
};
           
          },
        )
      ),
    );
  }
}