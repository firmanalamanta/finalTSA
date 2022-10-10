import 'package:slide1/Pages/login.dart';
import 'package:slide1/Pages/register_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget{
  const AuthPage ({Key key}) : super(key: key);
  @override
  State<AuthPage> createState() => _AuthPage();
}

class _AuthPage extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context){
    if (showLoginPage){
      return LoginPage(showRegisterPage: toggleScreens);
    }else{
      return RegisterPage(showLoginPage: toggleScreens);
    }
  }
}