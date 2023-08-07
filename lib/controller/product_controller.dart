import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopapp/models/category_model.dart';

class ProductController extends GetxController{
 
 var subcat = [] ; 

 
  getSubCategory(title) async{
    subcat.clear();
    var data = await rootBundle.loadString("lib/service/category_model.json");
    var decoded = categoryModelFromJson(data);
var s = decoded.category.where((element) => element.name == title).toList();
print('Matching categories: $s');

for (var e in s[0].subcategory) {
  subcat.add(e);
}


  }
}