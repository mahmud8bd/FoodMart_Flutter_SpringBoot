import 'package:flutter/material.dart';
import 'package:sazzadfood/screen/userprofile/component/body.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     drawer: Drawer(),
      body: Body(),
    );
  }
}
