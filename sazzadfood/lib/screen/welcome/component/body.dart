import 'package:flutter/material.dart';
import 'package:sazzadfood/component/rounded_button.dart';
import 'package:sazzadfood/screen/login/login.dart';
import 'package:sazzadfood/screen/signup/registration.dart';
import 'package:sazzadfood/screen/welcome/component/background.dart';
import 'package:sazzadfood/staticdata/constants.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Welcome Sfood',
            style: TextStyle(fontWeight: FontWeight.bold , fontSize: sWellcomeTextSize ,color: sPrimaryColor),
          ),
          Image.asset(
            "assets/food/mainlogo.png",
            height: size.height * 0.20,
          ),
          SizedBox(height: size.height * 0.05,),
          RoundedButton(
            text: "Login",
            color: sPrimaryColor,
            textColor: sPrimaryLightColor,
            presses: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
            },

          ),
          SizedBox(height: size.height * 0.01,),
          RoundedButton(
            text: "Registration",
            color: sPrimaryLightColor,
            textColor: sPrimaryColor,
            presses: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Resitration(),));
            },

          )
        ],
      ),
    );
  }
}
