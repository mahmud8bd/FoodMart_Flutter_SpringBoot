import 'package:flutter/material.dart';
import 'package:sazzadfood/models/Product.dart';
import 'package:sazzadfood/screen/food/foodDetails/food_details.dart';
import 'dart:convert';
import 'categorries.dart';
import 'constants.dart';
import 'item_card.dart';
import 'item_card_v2.dart';

class Body extends StatelessWidget {
   Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             Categories(),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Populer",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text("View All ",
                      style: TextStyle(fontSize: 14, color: kMainDarkColor)),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(
                  horizontal: kDefaultPaddin, vertical: kDefaultPaddin / 2),
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) => ItemCard(
                          product: products[index],
                          press: () {},
                        )),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recommend",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text("View All ",
                      style: TextStyle(fontSize: 14, color: kMainDarkColor)),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(
                  horizontal: kDefaultPaddin, vertical: kDefaultPaddin / 2),
              child: SizedBox(
                height: 90,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products_v2.length,
                    itemBuilder: (context, index) => ItemCardV2(
                          product: products_v2[index],
                          press: () {},
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
