import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sazzadfood/myproviders/CartCounterProvider.dart';
import 'package:sazzadfood/screen/homescreen.dart';
import 'package:provider/provider.dart';
import 'package:sazzadfood/staticdata/constants.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CartCounterProvider(),)
        ],
          child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SFood',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: sPrimaryColor,
            fontSize: 30,
            fontWeight: FontWeight.bold
          )
        ),
          primaryColor:sPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeApp(),
    );
  }
}
