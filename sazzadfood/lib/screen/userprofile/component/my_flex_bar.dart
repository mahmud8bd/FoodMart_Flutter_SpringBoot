import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sazzadfood/Api/base_url.dart';
import 'package:sazzadfood/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyFlexBar extends StatefulWidget {
  const MyFlexBar({
    super.key,
  });

  @override
  State<MyFlexBar> createState() => _MyFlexBarState();
}

class _MyFlexBarState extends State<MyFlexBar> {
  String? getMail;
  User? user;
  Future<void> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      getMail = prefs.getString('userEmail');
    });
  }
  Future<void> fetchUser() async {
    final fetchedUser = await getUserByEmail(getMail);
    setState(() {
      user = fetchedUser;
    });
  }
  Future<User?> getUserByEmail(String? email) async {
    if (email == null) return null;
    final apiUrl = '$baseUrl/get-by-email?email=$email';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final user = userFromJson(response.body);
        return user;
      } else {
        return null;
      }
    } catch (exception) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    getUserEmail().then((_) {
      fetchUser();
    });
  }
  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      title: Text('${user?.firstname ?? ''} ${user?.lastname ?? ''}'.toUpperCase()),
      centerTitle: true,
      background: ClipOval(
        child: Container(
          //color: Colors.red, // Set the border color
          width: 150, // Set the desired width
          height: 150, // Set the desired height
          child: Center(
            child: ClipOval(
              child: Image.asset(
                'assets/images/profile.jpg',
                fit: BoxFit.cover, // You can adjust the BoxFit as needed
                width: 140, // Adjust the image width to fit inside the border
                height: 140, // Adjust the image height to fit inside the border
              ),
            ),
          ),
        ),
      ),
    );
  }
}
