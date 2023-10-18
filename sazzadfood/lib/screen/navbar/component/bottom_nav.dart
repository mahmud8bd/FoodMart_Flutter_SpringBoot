import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:sazzadfood/staticdata/constants.dart';

class BottomNav extends StatefulWidget {
  final Function(int) onIndexChanged;
  BottomNav({
    super.key,
    required this.onIndexChanged,
  });
  @override
  State<BottomNav> createState() => _BottomNavState();
}
class _BottomNavState extends State<BottomNav> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          widget.onIndexChanged(_currentIndex);
        },
        backgroundColor: sPrimaryColor,
        items: [
          TabItem(
            icon: Icon(Icons.home),
            title: 'Home',
          ),
          TabItem(
            icon: Icon(Icons.category),
            title: 'Category'
          ),
          TabItem(
              icon: Icon(Icons.favorite),
              title: 'Wish'
          ),
          TabItem(
              icon: Icon(Icons.shopping_cart),
              title: 'Cart'
          ),
          TabItem(
            icon: Icon(Icons.person),
            title: 'Profile'
          )
        ]);
  }
}
