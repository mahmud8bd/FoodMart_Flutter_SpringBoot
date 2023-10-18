// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:sazzadfood/models/cartitem.dart';
// import 'package:sazzadfood/models/food.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class CartManager extends ChangeNotifier{
//   double amount = 0;
//   Set<Food> foods = {};
//   Map<String, int> quantity = {};
//   int itemsLength = 0;
//
//
//   List<CartItem> _cartItems = [];
//
//   void addToCart(Food foodItem) {
//     // Check if the item is already in the cart
//     final existingCartItemIndex = _cartItems.indexWhere(
//           (item) => item.foodId == foodItem.foodId,
//     );
//     if (existingCartItemIndex != -1) {
//       // If the item exists in the cart, increase its quantity
//       //_cartItems[existingCartItemIndex].quantity++;
//       amount += _cartItems[existingCartItemIndex].foodPrice;
//     } else {
//       // If the item doesn't exist in the cart, add it
//       //_cartItems.add(CartItem.fromFood(foodItem));
//     }
//     saveCart();
//   }
//
//   // Save cart items to shared preferences
//   void saveCart() async {
//     final prefs = await SharedPreferences.getInstance();
//     final cartData = _cartItems.map((item) => item.toJson()).toList();
//     prefs.setString('cart', jsonEncode(cartData));
//     notifyListeners();
//   }
//
//   // Load cart items from shared preferences
//   Future<void> loadCart() async {
//     final prefs = await SharedPreferences.getInstance();
//     final cartData = prefs.getString('cart');
//     if (cartData != null) {
//       final List<dynamic> cartList = jsonDecode(cartData);
//       _cartItems = cartList.map((item) => CartItem.fromJson(item)).toList();
//       notifyListeners();
//     }
//   }
//
//
//
//   // Remove an item from the cart based on its foodId
//   void removeFromCart(String foodId) {
//     final index = _cartItems.indexWhere((item) => item.foodId == foodId);
//     if (index != -1) {
//       //if (_cartItems[index].quantity > 1) {
//         // If the item has a quantity greater than 1, decrement the quantity
//        // _cartItems[index].quantity--;
//      // } else {
//         // If the item has a quantity of 1 or less, remove it from the cart
//        // _cartItems.removeAt(index);
//       //}
//       saveCart(); // Save the updated cart
//     }
//   }
//
// }
