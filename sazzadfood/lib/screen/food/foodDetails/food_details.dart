import 'package:flutter/material.dart';
import 'package:sazzadfood/models/food.dart';
import 'package:sazzadfood/screen/food/cart/cart_page.dart';
import 'package:sazzadfood/screen/food/foodDetails/components/body.dart';
import 'package:sazzadfood/screen/food/foodView/component/myfavIcon.dart';
import 'package:badges/badges.dart' as badger;
import 'package:sazzadfood/staticdata/constants.dart';
class FoodDetails extends StatefulWidget {
  final Food food;
  const FoodDetails({super.key, required this.food});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(food: widget.food),
    );
  }


  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: sPrimaryLightColor,
      foregroundColor: sPrimaryColor,
      elevation: 0,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>CartPage(),));
            },
            child: badger.Badge(
              badgeContent: Text('0'),
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ),
        const SizedBox(width: sDefaultPaddin),
        MyFavIcon(),
        const SizedBox(width: sDefaultPaddin)
      ],
    );
  }
}
