import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/consts/consts.dart';
import 'package:shopapp/consts/list.dart';
import 'package:shopapp/controller/product_controller.dart';
import 'package:shopapp/views/categoryscreen/category_detail.dart';
import 'package:shopapp/widget_common/bg_widget.dart';

class CategoryScrenn extends StatelessWidget {
  const CategoryScrenn({super.key});

  @override
  Widget build(BuildContext context) {
var controller = Get.put(ProductController());

    return bgWidget(
    child: Scaffold(
appBar: AppBar(
  title: category.text.fontFamily(bold).white.make(),
),
body: Container(
  padding: EdgeInsets.all(12),
  child: GridView.builder(
    shrinkWrap: true,
    itemCount: 9,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 8 , crossAxisSpacing: 8 , mainAxisExtent: 200), itemBuilder: (context,index){
    return Column(
      children: [
        Image.asset(categoryImageList[index],
        height: 120,
        width: 200,
        fit: BoxFit.cover,
        ),
        10.heightBox,
        "${categoryList[index]}".text.color(darkFontGrey).align(TextAlign.center).make(),
      ],
    ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() {
      controller.getSubCategory(categoryList[index]);


      Get.to(()=> CategoryDetail(title: categoryList[index]));
    });
  }),
),
    ),
    );
  }
}