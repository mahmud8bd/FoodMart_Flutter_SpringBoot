import 'package:flutter/material.dart';
import 'package:sazzadfood/screen/signup/component/body.dart';

class Resitration extends StatefulWidget {
  const Resitration({super.key});

  @override
  State<Resitration> createState() => _ResitrationState();
}

class _ResitrationState extends State<Resitration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
