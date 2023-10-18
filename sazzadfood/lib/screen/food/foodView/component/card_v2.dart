import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sazzadfood/models/food.dart';
import 'package:sazzadfood/screen/food/foodView/component/myfavIcon.dart';
import 'package:sazzadfood/staticdata/constants.dart';

class Cardv2 extends StatefulWidget {
  final Food foods;
  final Function() press;
  const Cardv2({super.key, required this.foods, required this.press});

  @override
  State<Cardv2> createState() => _Cardv2State();
}

class _Cardv2State extends State<Cardv2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
          horizontal: sDefaultPaddin / 4, vertical: sDefaultPaddin / 6),
      child: GestureDetector(
        onTap: widget.press,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(sDefaultPaddin / 4),
                  height: 80,
                  width: 250,
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
                  child: Row(
                    children: [
                      Hero(
                        tag: "${widget.foods.foodId}",
                        child: Image.asset(
                            "assets/food/${widget.foods.img}"
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: sDefaultPaddin / 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.foods.foodName,
                              style: const TextStyle(color: Colors.black),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Star.svg",
                                  color: Color(0xFFEEA939),
                                  height: 10,
                                ),
                                Text(
                                  " ${widget.foods.action}",
                                  style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
            Positioned(
              bottom: 15,
              right: 10,
              child: Text(
                "\৳${widget.foods.foodPrice}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(top: 10, right: 10, child: MyFavIcon()),
          ],
        ),
      ),
    );
  }
}
