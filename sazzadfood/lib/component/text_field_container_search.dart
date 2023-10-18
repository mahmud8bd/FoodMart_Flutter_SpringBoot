import 'package:flutter/material.dart';
import 'package:sazzadfood/staticdata/constants.dart';

class TextFieldContainerSearch extends StatelessWidget {
  final Widget child;

  const TextFieldContainerSearch({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      height: size.height * 0.08,
      width: size.width * 0.7,
      decoration: BoxDecoration(
          color: sPrimaryLightColor, borderRadius: BorderRadius.circular(29)),
      child: child,
    );
  }
}
