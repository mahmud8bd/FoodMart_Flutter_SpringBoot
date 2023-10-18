import 'package:flutter/material.dart';
import 'package:sazzadfood/Api/api_service_food.dart';
import 'package:sazzadfood/models/food.dart';
import 'package:sazzadfood/screen/food/foodDetails/food_details.dart';
import 'package:sazzadfood/screen/food/foodView/component/card_v2.dart';
import 'package:sazzadfood/screen/food/foodView/component/categories.dart';
import 'package:sazzadfood/screen/food/foodView/component/slider_carusel.dart';
import 'package:sazzadfood/staticdata/constants.dart';

import 'card_v1.dart';

class Body extends StatefulWidget {
   Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ApiServiceFood _serviceFood = ApiServiceFood();

  @override
  void initState() {
    _serviceFood.fetchFood();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
            padding: EdgeInsets.only(bottom: 8, left: 10, right: 10),
        sliver: SliderCarusel(),
        ),
        SliverPadding(
            padding: EdgeInsets.all(2),
          sliver: SliverToBoxAdapter(
            child: MyCategories(),
          ),
        ),
        SliverPadding(
          padding:  EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Populer",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text("View All ",
                    style: TextStyle(fontSize: 14, color: sPrimaryColor)),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding:  EdgeInsets.symmetric(
              horizontal: sDefaultPaddin, vertical: sDefaultPaddin / 2),
          sliver: SliverToBoxAdapter(
            child: SizedBox(
              height: 240,
              child: FutureBuilder<List<Food>?>(
                future: _serviceFood.fetchFood(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }else if(snapshot.hasError){
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }else if(!snapshot.hasData || snapshot.data!.isEmpty){
                    return Center(child: Text('No data available'));
                  }else{
                    final foods = snapshot.data;
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: foods!.length,
                        itemBuilder: (context, index) => CardV1(
                          foods: foods[index],
                          press: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FoodDetails(food: foods[index]),
                              )),
                        ));
                  }
                },
              ),
            ),
          ),
        ),
        SliverPadding(
          padding:  EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("New Food",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text("View All ",
                    style: TextStyle(fontSize: 14, color: sPrimaryColor)),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding:  EdgeInsets.symmetric(
              horizontal: sDefaultPaddin, vertical: sDefaultPaddin / 2),
          sliver: SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: FutureBuilder<List<Food>?>(
                future: _serviceFood.fetchFood(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }else if(snapshot.hasError){
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }else if(!snapshot.hasData || snapshot.data!.isEmpty){
                    return Center(child: Text('No data available'));
                  }else{
                    final foods = snapshot.data;
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: foods!.length,
                        itemBuilder: (context, index) => Cardv2(
                          foods: foods[index],
                          press: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FoodDetails(food: foods[index]),
                              )),
                        ));
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
