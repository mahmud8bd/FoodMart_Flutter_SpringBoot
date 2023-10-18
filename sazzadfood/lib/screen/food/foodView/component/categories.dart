import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sazzadfood/staticdata/constants.dart';

class MyCategories extends StatefulWidget {
  MyCategories({super.key});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<MyCategories> {
  List<String> categories = [
    "Hotdog",
    "Pizza",
    "Carrot",
    "Cookie",
    "Donut",
    "Cupcake",
    "Lemon",
    "Pear",
    "Popcorn",
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.symmetric(
          horizontal: sDefaultPaddin, vertical: sDefaultPaddin),
      child: SizedBox(
        height: 55,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: sDefaultPaddin / 10),
        child: Container(
          width: 75,
          decoration: BoxDecoration(
            color: selectedIndex == index ? sPrimaryColor : sPrimaryDeepLightColor,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/category/${categories[index]}.svg",
                width: size.width * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: selectedIndex == index ? sMainColor : sTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
