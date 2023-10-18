import 'package:flutter/material.dart';
import 'package:sazzadfood/screen/food/catagory/component/body.dart';
import 'package:sazzadfood/staticdata/constants.dart';

class Catagory extends StatefulWidget {
  const Catagory({super.key});

  @override
  State<Catagory> createState() => _CatagoryState();
}

class _CatagoryState extends State<Catagory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: sPrimaryColor,
        title: Text('Category'),
      ),
      body: BodyCategory(),
    );
  }
}
