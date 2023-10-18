import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sazzadfood/Api/base_url.dart';
import 'package:sazzadfood/component/already_have_an_account.dart';
import 'package:sazzadfood/component/rounded_button.dart';
import 'package:sazzadfood/component/rounded_input_field.dart';
import 'package:sazzadfood/component/rounded_password_field.dart';
import 'package:sazzadfood/screen/login/component/background.dart';
import 'package:sazzadfood/screen/navbar/navbar.dart';
import 'package:sazzadfood/screen/signup/registration.dart';
import 'package:http/http.dart' as http;
import 'package:sazzadfood/staticdata/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatelessWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> loginUser(String email, String password) async {
      final String _baseUrl = baseUrl;
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
        final token = response.body[0];
        print(token);
        SharedPreferences storage = await SharedPreferences.getInstance();
        await storage.setString('userEmail', email);
        final getemail = storage.getString('userEmail');
        print(getemail);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NavBar(),
            ));

      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Center(child: Text('Email and password not Match!')),
            backgroundColor: Colors.cyanAccent, // Customize the background color
          ),
        );
      }
    }

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: sPrimaryLightColor, // Border color
                    width: 4.0, // Border width
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: 70, // Icon size
                    color: sPrimaryColor, // Icon color
                  ),
                ),
              ),
            ),
            Text(
              "Login",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: sWellcomeTextSize,
                  color: sPrimaryColor),
            ),
            RoundedInputField(
              controller: _email,
              hintText: "Your Email",
              icon: Icons.person,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              controller: _password,
              onChanged: (value) {},
            ),
            RoundedButton(
                text: "Login",
                presses: () {
                  loginUser(_email.text.toString(), _password.text.toString());
                },
                color: sPrimaryColor,
                textColor: sPrimaryLightColor),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
                login: true,
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Resitration(),
                      ));
                })
          ],
        ),
      ),
    );
  }
}
