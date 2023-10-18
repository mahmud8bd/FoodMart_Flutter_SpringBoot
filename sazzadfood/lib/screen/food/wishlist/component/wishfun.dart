import 'package:shared_preferences/shared_preferences.dart';

class FoodWishlist {
  List<String> _wishlistItems = [];

  Future<void> addItem(String foodId) async {
    _wishlistItems.add(foodId);
    await _saveWishlist();
  }

  Future<void> removeItem(String foodId) async {
    _wishlistItems.remove(foodId);
    await _saveWishlist();
  }

  List<String> get items => _wishlistItems;

  Future<void> _saveWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('foodWishlist', _wishlistItems);
  }

  Future<void> loadWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    final wishlist = prefs.getStringList('foodWishlist');
    if (wishlist != null) {
      _wishlistItems = wishlist;
    }
  }
}
