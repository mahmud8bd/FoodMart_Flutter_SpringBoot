// To parse this JSON data, do
//
//     final cartItem = cartItemFromJson(jsonString);

import 'dart:convert';

List<CartItem> cartItemFromJson(String str) => List<CartItem>.from(json.decode(str).map((x) => CartItem.fromJson(x)));

String cartItemToJson(List<CartItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartItem {
  String foodId;
  String userId;
  String foodName;
  String foodType;
  String img;
  String foodDescription;
  double foodPrice;
  double foodDiscount;
  String shopId;
  String shopName;
  String shopAddress;
  String action;
  String quantity;

  CartItem({
    required this.foodId,
    required this.userId,
    required this.foodName,
    required this.foodType,
    required this.img,
    required this.foodDescription,
    required this.foodPrice,
    required this.foodDiscount,
    required this.shopId,
    required this.shopName,
    required this.shopAddress,
    required this.action,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    foodId: json["foodId"],
    userId: json["userId"],
    foodName: json["foodName"],
    foodType: json["foodType"],
    img: json["img"],
    foodDescription: json["foodDescription"],
    foodPrice: json["foodPrice"]?.toDouble(),
    foodDiscount: json["foodDiscount"]?.toDouble(),
    shopId: json["shopId"],
    shopName: json["shopName"],
    shopAddress: json["shopAddress"],
    action: json["action"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "foodId": foodId,
    "userId": userId,
    "foodName": foodName,
    "foodType": foodType,
    "img": img,
    "foodDescription": foodDescription,
    "foodPrice": foodPrice,
    "foodDiscount": foodDiscount,
    "shopId": shopId,
    "shopName": shopName,
    "shopAddress": shopAddress,
    "action": action,
    "quantity": quantity,
  };
}
