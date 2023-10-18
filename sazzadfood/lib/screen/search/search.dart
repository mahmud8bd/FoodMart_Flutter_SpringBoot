import 'package:flutter/material.dart';
import 'package:sazzadfood/screen/search/component/body.dart';
import 'package:sazzadfood/screen/search/component/search_hearder.dart';
import 'package:sazzadfood/staticdata/constants.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        foregroundColor: sPrimaryColor,
        elevation: 0,
        title: SearchHeader(),
      ),
      body: Body(),
    );
  }
}

