import 'package:flutter/material.dart';
import 'package:shopapp/consts/colors.dart';
import 'package:shopapp/consts/consts.dart';
import 'package:shopapp/consts/list.dart';
import 'package:shopapp/views/auth_screen/home_screen/component/feature_button.dart';
import 'package:shopapp/widget_common/home_buttons.dart';

class Home_mainScreen extends StatelessWidget {
  const Home_mainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const  EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(child:  Column(
children: [
  Container(
    alignment: Alignment.center,
    height: 60,
    color: lightGrey,
    child: TextFormField(

      decoration:const InputDecoration(
        border: InputBorder.none,
        suffixIcon: Icon(Icons.search),
        filled: true,
        fillColor: whiteColor,
        hintText: searchanything,
        hintStyle: TextStyle(
          color: textfieldGrey,
        ),
      ),
    ),
  ),
  //swipper brand
  10.heightBox,
  Expanded(
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          // swipper brand
          VxSwiper.builder(
        aspectRatio: 16/9,
        autoPlay: true,
        height: 150,
        enlargeCenterPage: true,
        itemCount: sliderList.length, 
      itemBuilder: (context,index){
        return Image.asset(sliderList[index],
        fit: BoxFit.fitWidth,
        ).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).make();
      }),
      10.heightBox,
      // create deal button
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: 
        List.generate(2, (index) => homButtons(
          height: context.screenHeight *0.15,
          width: context.screenWidth/2.5,
          icon: index == 0 ? icTodaysDeal : icFlashDeal , 
          title: index == 0 ? todaydeal : flashSale,
    
        )),
      ),
    
      //2nd swipper
      10.heightBox,
       VxSwiper.builder(
        aspectRatio: 16/9,
        autoPlay: true,
        height: 150,
        enlargeCenterPage: true,
        itemCount: secondSliderList.length, 
      itemBuilder: (context,index){
        return Image.asset(secondSliderList[index],
        fit: BoxFit.fitWidth,
        ).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).make();
      }),
    
      10.heightBox,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(3, (index) => homButtons(
          height: context.screenHeight *0.15,
          width: context.screenWidth/3.5,
          icon: index == 0 ? icTopCategories : index == 1 ? icBrands : icTopSeller,
          title:  index == 0 ? topCategories : index == 1 ? brand : topSeller ,
        ),
        ),
      ),
      // create fueture category
      10.heightBox,
      Align(
        alignment: Alignment.centerLeft,
        child: featureCategory.text.color(darkFontGrey).size(18).fontFamily(semibold).make()),
     20.heightBox,
     SingleChildScrollView(
      scrollDirection: Axis.horizontal,
       child: Row(
        children: List.generate(3, (index) => Column(
          children: [
            featureButton(title: featureTitle1[index], icon: featureImage1[index]),
            10.heightBox,
            featureButton(title: featureTitle2[index], icon:  featureImage2[index]),
          ],
        ),).toList(),
       ),
     ) ,
     20.heightBox,
     Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: redColor,
        
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
children: [
  fuetureProduct.text.white.fontFamily(bold).size(18).make(),
  10.heightBox,
  SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: 
        List.generate(6, (index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Image.asset(imgP1 , width: 150, fit: BoxFit.cover,),
    10.heightBox,
    "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
    10.heightBox,
    "600\$".text.color(redColor).fontFamily(bold).size(16).make(),
  
  
  ],
        ).box.white.margin(EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(EdgeInsets.all(8)).make())
      ,
    ),
  ),

],

      ),
     ), 

     //Swiper third
     20.heightBox,
      VxSwiper.builder(
        aspectRatio: 16/9,
        autoPlay: true,
        height: 150,
        enlargeCenterPage: true,
        itemCount: secondSliderList.length, 
      itemBuilder: (context,index){
        return Image.asset(secondSliderList[index],
        fit: BoxFit.fitWidth,
        ).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).make();
      }),
    // all product section
    20.heightBox,
GridView.builder(
  physics: const NeverScrollableScrollPhysics(),
  shrinkWrap: true,
  itemCount: 6,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,mainAxisSpacing:8 ,crossAxisSpacing: 8,mainAxisExtent: 300,), itemBuilder: (context,index){
  return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Image.asset(imgP5 , 
    height: 200,
    width: 200, fit: BoxFit.cover,),
    const Spacer(),
    10.heightBox,
    "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
    10.heightBox,
    "600\$".text.color(redColor).fontFamily(bold).size(16).make(),
  
  
  ],
        ).box.white.margin(EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(EdgeInsets.all(12)).make();
})
        ],
      ),
    ),
    

    //feature product
    

  ),

],
      )),

    );
  }
}