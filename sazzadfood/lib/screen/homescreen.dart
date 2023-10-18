import 'package:flutter/material.dart';
import 'package:sazzadfood/screen/welcome/welcome.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return const Welcome();
  }
}
