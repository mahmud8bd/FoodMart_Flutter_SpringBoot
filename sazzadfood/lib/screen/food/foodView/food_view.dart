import 'package:flutter/material.dart';
import 'package:sazzadfood/screen/food/foodView/component/body.dart';
import 'package:sazzadfood/screen/search/search.dart';
import 'package:sazzadfood/staticdata/constants.dart';

class FoodView extends StatefulWidget {

   FoodView({super.key});

  @override
  State<FoodView> createState() => _FoodViewState();
}

class _FoodViewState extends State<FoodView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: sPrimaryColor,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Search(),));
               },
              child: Icon(
                  Icons.search,
                size: 30,
              ),
            ),
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.production_quantity_limits),
            Text('Sfood')
          ],
        ),
      ),
      drawer: Drawer(
        child: Icon(
          Icons.add,
        ),
      ),
      backgroundColor: sPrimaryLightColor,
      body: Stack(
        children: [
          Body()
        ],
      ),
    );
  }
}
