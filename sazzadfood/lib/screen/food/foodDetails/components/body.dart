import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazzadfood/Api/api_service_food.dart';
import 'package:sazzadfood/models/cartitem.dart';
import 'package:sazzadfood/models/food.dart';
import 'package:sazzadfood/myproviders/CartCounterProvider.dart';
import 'package:sazzadfood/screen/food/foodDetails/components/quantity_handler.dart';
import 'package:sazzadfood/staticdata/constants.dart';

import 'description.dart';

class Body extends StatefulWidget {
  final Food food;
  const Body({super.key, required this.food});
  @override
  State<Body> createState() => _BodyState();
}
class _BodyState extends State<Body> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final cartCounterProvider = Provider.of<CartCounterProvider>(context);
    final ApiServiceFood _apiServiceFood =ApiServiceFood();
    addTocart(){
      CartItem cartItem = CartItem(
          foodId: widget.food.foodId,
          userId: '1',
          foodName: widget.food.foodName,
          foodType: widget.food.foodType,
          img: widget.food.img,
          foodDescription: widget.food.foodDescription,
          foodPrice: widget.food.foodPrice,
          foodDiscount: widget.food.foodDiscount,
          shopId: widget.food.shopId,
          shopName: widget.food.shopName,
          shopAddress: widget.food.shopAddress,
          action: widget.food.action,
          quantity: quantity.toString()
      );
      _apiServiceFood.addToCart(cartItem);
    }
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: sPrimaryLightColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: sDefaultPaddin),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            productInfo(title: "Shop", food: widget.food.shopName),
                            const SizedBox(height: sDefaultPaddin / 2),
                            productInfo(title: "Code", food: widget.food.foodId),
                            const SizedBox(height: sDefaultPaddin / 2),
                            productInfo(
                                title: "Type", food: widget.food.foodType,),
                            const SizedBox(height: sDefaultPaddin / 2),
                          ],
                        ),
                        Expanded(
                          child: Hero(
                            tag: "${widget.food.foodId}",
                            child: Image.asset(
                              "assets/food/${widget.food.img}",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: sDefaultPaddin,
              right: sDefaultPaddin,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(height: sDefaultPaddin / 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.food.foodName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "\৳" + (widget.food.foodPrice + 100).toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: sMainDarkColor,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        Text(
                          "  \৳" + widget.food.foodPrice.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: sDefaultPaddin / 2),
                const SizedBox(height: sDefaultPaddin / 2),
                Description(food: widget.food),
                const SizedBox(height: sDefaultPaddin / 2),
                QuantityHandler(
                  onBtnTapped: (val) => quantity = val,
                ),
                const SizedBox(height: sDefaultPaddin / 2),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: sPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          onPressed: () {
                            addTocart();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Center(child: Text('Add Successfully')),
                                backgroundColor: sPrimaryColor, // Customize the background color
                              ),
                            );
                          },
                          child: Text(
                            "Add To Cart".toUpperCase(),
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: sDefaultPaddin / 2),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class productInfo extends StatelessWidget {
  const productInfo({super.key, required this.food, required this.title});

  final String food;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: sPrimaryColor,
            fontSize: 18
          ),
        ),
        Text(
          food,
          style: TextStyle(
            color: Color(0xFF8B2833).withOpacity(0.5),
              fontSize: sButtonTextSize
          ),
        ),
      ],
    );
  }
}
