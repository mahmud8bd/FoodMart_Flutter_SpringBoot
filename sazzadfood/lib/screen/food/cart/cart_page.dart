import 'package:flutter/material.dart';
import 'package:sazzadfood/screen/food/cart/component/cartscreen.dart';
import 'package:sazzadfood/staticdata/constants.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sPrimaryLightColor,
      body: Stack(
        children: [
          CartScreen(),
        ],
      ),
    );
  }
}
