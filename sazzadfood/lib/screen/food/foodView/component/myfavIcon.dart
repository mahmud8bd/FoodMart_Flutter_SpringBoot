import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sazzadfood/staticdata/constants.dart';



class MyFavIcon extends StatelessWidget {
  const MyFavIcon({
    super.key,
    //required this.product,
  });

  //final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        //color: product.isfav == "true" ? sMainDarkColor : sTextColor,
        color: sPrimaryColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            //color: product.isfav == "true" ? sMainDarkColor : sTextColor,
            color: sTextColor,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SvgPicture.asset(
          "assets/icons/heart.svg",
        ),
      ),
    );
  }
}
