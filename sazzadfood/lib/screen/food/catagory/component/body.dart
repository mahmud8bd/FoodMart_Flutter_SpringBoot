import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sazzadfood/staticdata/constants.dart';

class BodyCategory extends StatefulWidget {
  BodyCategory({super.key});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<BodyCategory> {
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
    "Popcorn",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: sDefaultPaddin, vertical: sDefaultPaddin),
      child: SizedBox(
        //height: 55,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: (categories.length / 2).ceil(), // Calculate the number of rows
          itemBuilder: (context, index) => buildCategoryRow(index),
        ),
      ),
    );
  }

  Widget buildCategoryRow(int rowIndex) {
    Size size = MediaQuery.of(context).size;
    final startIndex = rowIndex * 2;
    final endIndex = (startIndex + 1 < categories.length) ? startIndex + 2 : startIndex + 1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(endIndex - startIndex, (index) {
        final categoryIndex = startIndex + index;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = categoryIndex;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                color: selectedIndex == categoryIndex
                    ? sPrimaryColor
                    : sPrimaryDeepLightColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/category/${categories[categoryIndex]}.svg",
                    width: size.width * 0.2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      categories[categoryIndex],
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: selectedIndex == categoryIndex ? sMainColor : sTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
