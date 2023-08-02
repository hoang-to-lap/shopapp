import 'package:flutter/material.dart';
import 'package:shopapp/consts/colors.dart';
import 'package:shopapp/consts/consts.dart';
import 'package:shopapp/consts/list.dart';
import 'package:shopapp/widget_common/our_button.dart';

class itemDetail extends StatelessWidget {
  final String? titile;
  const itemDetail({super.key, required this.titile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: titile!.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_outline,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Swippwer section
                    VxSwiper.builder(
                        autoPlay: true,
                        height: 350,
                        aspectRatio: 16 / 9,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            imgFc5,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        }),

                    10.heightBox,

                    //title and detail section
                    titile!.text
                        .size(16)
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),

                    //rating
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      size: 25,
                      count: 5,
                      stepInt: true,
                    ),
                    10.heightBox,
                    "300\$"
                        .text
                        .color(redColor)
                        .fontFamily(bold)
                        .size(18)
                        .make(),

                    10.heightBox,

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "Seller".text.white.fontFamily(semibold).make(),
                              5.heightBox,
                              "In house brand"
                                  .text
                                  .color(darkFontGrey)
                                  .fontFamily(semibold)
                                  .make(),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.message_rounded,
                            color: darkFontGrey,
                          ),
                        ),
                      ],
                    )
                        .box
                        .height(60)
                        .padding(EdgeInsets.symmetric(horizontal: 16))
                        .color(textfieldGrey)
                        .make(),

                    //color section
                    20.heightBox,
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: List.generate(
                                  3,
                                  (index) => VxBox()
                                      .size(40, 40)
                                      .roundedFull
                                      .color(Vx.randomPrimaryColor)
                                      .margin(
                                          EdgeInsets.symmetric(horizontal: 4))
                                      .make()),
                            ),
                          ],
                        )
                            .box
                            .padding(
                              EdgeInsets.all(8),
                            )
                            .make(),
                            //qualify row
                            5.heightBox,
                              Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Quantity".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: [
                                IconButton(onPressed: (){}, icon: const Icon(Icons.remove)),
                                "0".text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                                 IconButton(onPressed: (){}, icon: const Icon(Icons.add)),

                                 10.widthBox,
                                 "(0 available)".text.color(textfieldGrey).make(),
                              ],
                            ),

                            // Total row
                             
                          ],
                        )
                            .box
                            .padding(
                              EdgeInsets.all(8),
                            )
                            .make(),

                            // row 2
                                 Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total".text.color(textfieldGrey).make(),
                            ),
                            "0.0000\$".text.color(redColor).size(16).fontFamily(bold).make(),
                          ],
                        )
                            .box
                            .padding(
                              EdgeInsets.all(8),
                            )
                            .make(),
                            

                      ],
                    ).box.white.shadowSm.make(),
// decreption
              10.heightBox,
            "Description".text.color(darkFontGrey).fontFamily(semibold).make(),
            10.heightBox,
            "This is a dummy item".text.color(darkFontGrey).make(),

           //button selection
           10.heightBox,
ListView(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  children: List.generate(iteamDetailButtonList.length, (index) => ListTile(
    title: "${iteamDetailButtonList[index]}".text.fontFamily(semibold).color(darkFontGrey).make(),
    trailing: const Icon(Icons.arrow_forward),

  )),
),
// product you may like section
20.heightBox,
productYouMayLike.text.fontFamily(bold).size(16).color(darkFontGrey).make(),
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
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
              color: redColor,
              onPress: () {},
              title: "Add to cart",
              tetxColor: whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
