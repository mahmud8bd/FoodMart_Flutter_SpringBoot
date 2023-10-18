import 'package:flutter/material.dart';
import 'package:sazzadfood/staticdata/constants.dart';

class orDivider extends StatelessWidget {
  const orDivider({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style: TextStyle(fontWeight: FontWeight.bold, color: sPrimaryColor),
            ),
          ),
          buildDivider(),

        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
        child: Divider(
          color: Colors.teal.shade500,
          height: 1.5,
        ));
  }
}
