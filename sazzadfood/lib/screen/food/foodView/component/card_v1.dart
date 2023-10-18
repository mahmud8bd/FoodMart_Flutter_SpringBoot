import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sazzadfood/models/food.dart';
import 'package:sazzadfood/screen/food/foodView/component/myfavIcon.dart';
import 'package:sazzadfood/staticdata/constants.dart';

class CardV1 extends StatefulWidget {
  final Food foods;
  final Function() press;
  const CardV1({super.key, required this.foods, required this.press});

  @override
  State<CardV1> createState() => _CardV1State();
}

class _CardV1State extends State<CardV1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
          horizontal: sDefaultPaddin / 2, vertical: sDefaultPaddin / 4),
      child: GestureDetector(
        onTap: widget.press,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(sDefaultPaddin / 2),
                  height: 210,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: sTextColor,
                        spreadRadius: 0.1,
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 130,
                        child: Hero(
                          tag: "${widget.foods.foodId}",
                          child: Image.asset("assets/food/${widget.foods.img}"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: sDefaultPaddin / 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.foods.foodName,
                              style: const TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/Star.svg",
                                      color: Color(0xFFEEA939),
                                      height: 15,
                                    ),
                                    Text(
                                      " ${widget.foods.action}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Text(
                                  "\৳${widget.foods.foodPrice}",
                                  style: const TextStyle(

                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(top: 10, right: 10, child: MyFavIcon()),
          ],
        ),
      ),
    );
  }
}
