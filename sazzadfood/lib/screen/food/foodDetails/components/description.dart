import 'package:flutter/material.dart';
import 'package:sazzadfood/models/food.dart';
import 'package:sazzadfood/staticdata/constants.dart';


class Description extends StatelessWidget {
  const Description({super.key, required this.food});

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Description",
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.black,
              ),
            )),
        const SizedBox(height: sDefaultPaddin / 5),
        Text(
          food.foodDescription,
          style: const TextStyle(height: 1.5),
        ),
      ],
    );
  }
}
