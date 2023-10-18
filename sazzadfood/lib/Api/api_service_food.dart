import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sazzadfood/Api/base_url.dart';
import 'package:sazzadfood/models/WishList.dart';
import 'package:sazzadfood/models/cartitem.dart';
import 'package:sazzadfood/models/food.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ApiServiceFood{
  final String _baseUrl = baseUrl;

  Future<List<Food>?> fetchFood() async {
    final url = '$_baseUrl/food';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<Food> foods = foodFromJson(response.body);
      print(response.body);
      return foods;
    } else {
      throw Exception('Fail to load data');
    }
  }
  Future<void> loginUser(String email, String password) async {
    final loginData = {
      'email': email,
      'password': password,
    };
    final jsonBody = json.encode(loginData);
    final url = '$_baseUrl/authenticate';
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        headers: {"content-type": "application/json"},
        body: jsonBody);
    if (response.statusCode == 200) {
      final token = response.body;
      print(token);

    }
  }
  Future<void> saveUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user_email', email);
  }
  Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_email');
  }

  Future<void> addToCart(CartItem cartItem) async {
      final url = '$_baseUrl/saveCart';
      final uri = Uri.parse(url);
      final response = await http.post(uri,
          headers: {"content-type": "application/json"},
          body: jsonEncode(cartItem.toJson()));
      if (response.statusCode == 200) {
      }
  }

  Future<List<CartItem>?> fetchCart() async {
    final url = '$_baseUrl/cart';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<CartItem> data = cartItemFromJson(response.body);
      return data;
    } else {
      throw Exception('Fail to load data');
    }
  }

  Future<void> addToWishList(WishList wishList) async {
    final url = '$_baseUrl/saveWish';
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        headers: {"content-type": "application/json"},
        body: jsonEncode(wishList.toJson()));
    if (response.statusCode == 200) {
    }
  }

  Future<List<WishList>?> fetchWishList() async {
    final url = '$_baseUrl/getWishList';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<WishList> data = wishListFromJson(response.body);
      return data;
    } else {
      throw Exception('Fail to load data');
    }
  }


  Future<void> deleteCartItem(String id) async {
    final url = Uri.parse('$_baseUrl/deleteCart?id=$id');
    try {
      final response = await http.delete(url);
      if (response.statusCode == 200) {
        // Cart item deleted successfully
        print('Cart item deleted');
      } else {
        // Handle the error (e.g., display an error message)
        print('Failed to delete cart item. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network errors or exceptions
      print('Error: $error');
    }
  }

}