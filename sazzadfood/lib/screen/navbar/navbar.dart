import 'package:flutter/material.dart';
import 'package:sazzadfood/screen/food/cart/cart_page.dart';
import 'package:sazzadfood/screen/food/catagory/catagory.dart';
import 'package:sazzadfood/screen/food/foodView/food_view.dart';
import 'package:sazzadfood/screen/food/wishlist/wishlist.dart';
import 'package:sazzadfood/screen/navbar/component/bottom_nav.dart';
import 'package:sazzadfood/screen/userprofile/user_profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  final pages = [FoodView(), Catagory(), WishList(), CartPage(), UserProfile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      //extendBody: true,
      bottomNavigationBar: BottomNav(
        onIndexChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
