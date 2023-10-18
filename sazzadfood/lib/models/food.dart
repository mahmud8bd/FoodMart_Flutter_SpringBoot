import 'dart:convert';
import 'package:sazzadfood/models/cartitem.dart';

List<Food> foodFromJson(String str) => List<Food>.from(json.decode(str).map((x) => Food.fromJson(x)));

String foodToJson(List<Food> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Food {
  String foodId;
  String foodName;
  String foodType;
  String img;
  String foodDescription;
  double foodPrice;
  double foodDiscount;
  double rating;
  String shopId;
  String shopName;
  String shopAddress;
  String action;

  Food({
    required this.foodId,
    required this.foodName,
    required this.foodType,
    required this.img,
    required this.foodDescription,
    required this.foodPrice,
    required this.foodDiscount,
    required this.rating,
    required this.shopId,
    required this.shopName,
    required this.shopAddress,
    required this.action,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    foodId: json["foodId"],
    foodName: json["foodName"],
    foodType: json["foodType"],
    img: json["img"],
    foodDescription: json["foodDescription"],
    foodPrice: json["foodPrice"]?.toDouble(),
    foodDiscount: json["foodDiscount"]?.toDouble(),
    rating: json["rating"]?.toDouble(),
    shopId: json["shopId"],
    shopName: json["shopName"],
    shopAddress: json["shopAddress"],
    action: json["action"],
  );

  Map<String, dynamic> toJson() => {
    "foodId": foodId,
    "foodName": foodName,
    "foodType": foodType,
    "img": img,
    "foodDescription": foodDescription,
    "foodPrice": foodPrice,
    "foodDiscount": foodDiscount,
    "rating": rating,
    "shopId": shopId,
    "shopName": shopName,
    "shopAddress": shopAddress,
    "action": action,
  };
}
