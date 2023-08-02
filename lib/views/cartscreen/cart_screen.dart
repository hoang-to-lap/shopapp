import 'package:flutter/material.dart';
import 'package:shopapp/consts/consts.dart';

class cartScreen extends StatelessWidget {
  const cartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: "Cart is empty".text.fontFamily(semibold).color(darkFontGrey).makeCentered(),


    );
  }
}