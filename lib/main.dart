//import 'package:slide1/theme.dart';
import 'package:flutter/material.dart';
import 'package:slide1/Pages/login.dart';
import 'package:slide1/Pages/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:slide1/Pages/welcom_screen.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: WelcomScreen(),
    );
  }
}

 //title: 'Emergency Notes',
 //theme: lightThemeData(context),
      //darkTheme: darkThemeData(context),
      //themeMode: ThemeMode.system,