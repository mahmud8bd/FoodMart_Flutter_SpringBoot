import 'package:flutter/material.dart';
import 'package:sazzadfood/component/already_have_an_account.dart';
import 'package:sazzadfood/component/rounded_button.dart';
import 'package:sazzadfood/component/rounded_input_field.dart';
import 'package:sazzadfood/component/rounded_password_field.dart';
import 'package:sazzadfood/screen/login/component/background.dart';
import 'package:sazzadfood/screen/login/login.dart';
import 'package:sazzadfood/screen/navbar/navbar.dart';
import 'package:sazzadfood/screen/signup/component/or_divider.dart';
import 'package:sazzadfood/screen/signup/component/social_icon.dart';
import 'package:sazzadfood/staticdata/constants.dart';

import '../../../fireAuth/fire_auth.dart';

class Body extends StatelessWidget {
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final FireAuth _fireAuth = FireAuth();
   Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
          child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20),
        Text(
          "Sign Up",
          style: TextStyle(fontWeight: FontWeight.bold ,fontSize: sWellcomeTextSize, color: sPrimaryColor),
        ),
          RoundedInputField(
              hintText: "Your First Name",
              icon: Icons.person,
              onChanged: (value) {},
              controller: _firstname,
          ),
        RoundedInputField(
          hintText: "Your Last Name",
          icon: Icons.person,
          onChanged: (value) {},
          controller: _lastname,
        ),
        RoundedInputField(
          hintText: "Your Email",
          icon: Icons.person,
          onChanged: (value) {},
          controller: _email,
        ),

          RoundedPasswordField(
              onChanged: (value) {},
            controller: _password,
          ),
          RoundedButton(
              text: "Sign Up",
              presses: () {
                _fireAuth.signUpWithEmailAndPassword(_email.text, _password.text);
              },
              color: sPrimaryColor,
              textColor: sPrimaryLightColor),
          SizedBox(height: size.height * 0.03),
          AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              }),
          orDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SocialIcon(
                iconSrc: "assets/icons/facebook.svg",
                press: (){
                },
              ),
              SocialIcon(
                iconSrc: "assets/icons/twitter.svg",
                press: (){

                },
              ),
              SocialIcon(
                iconSrc: "assets/icons/google-plus.svg",
                press: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NavBar(),));
                },
              )
            ],
          )
      ],
    ),
        ));
  }
}
