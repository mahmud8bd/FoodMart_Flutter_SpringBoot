import 'dart:convert';

List<WishList> wishListFromJson(String str) => List<WishList>.from(json.decode(str).map((x) => WishList.fromJson(x)));

String wishListToJson(List<WishList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WishList {
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
  bool wish;

  WishList({
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
    required this.wish,
  });

  factory WishList.fromJson(Map<String, dynamic> json) => WishList(
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
    wish: json["wish"],
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
    "wish": wish,
  };
}
