import 'package:flutter/material.dart';
import 'package:sazzadfood/screen/login/login.dart';
import 'package:sazzadfood/screen/userprofile/component/my_flex_bar.dart';
import 'package:sazzadfood/staticdata/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> logout() async {
      // Clear user data from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear(); // You can clear specific keys if needed

      // Navigate to the login or home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Login()), // Replace with your login screen widget
      );
    }

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 220,
          backgroundColor: sPrimaryColor,
          flexibleSpace: MyFlexBar(),
        ),
        SliverList(
            delegate: SliverChildListDelegate(<Widget>[
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('Hasan'),
                  subtitle: GestureDetector(
                    onTap: (){
                      logout();
                    },
                      child: Center(child: Text('Logout'))
                  ),
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.arrow_right_outlined),
                ),
                Text('User Settings',
                style: TextStyle(
                  color: sPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                ListTile(
                  title: Text('User'),
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.arrow_right_outlined),
                ),ListTile(
                  title: Text('User'),
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.arrow_right_outlined),
                ),ListTile(
                  title: Text('User'),
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.arrow_right_outlined),
                ),ListTile(
                  title: Text('User'),
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.arrow_right_outlined),
                ),ListTile(
                  title: Text('User'),
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.arrow_right_outlined),
                ),
                ListTile(
                  title: Text('User'),
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.arrow_right_outlined),
                ),
              ],
            ),
          )
        ]))
      ],
    );
  }
}
