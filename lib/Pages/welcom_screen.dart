import 'package:flutter/material.dart';
import 'package:slide1/Pages/login.dart';
import 'package:slide1/warna.dart';

class WelcomScreen extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(flex: 2),
            Image.asset("images/pomi.png"),
            //Image.asset("images/phomi.png"),
            Spacer(flex: 2),
            Text(
              "Extension Number List \nand Notes",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontWeight: FontWeight.normal),
              ),
            Spacer(),
            Text(
              "Zero Accident Requires \n100% Commitment To Satey",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context)
                .textTheme
                .bodyText1
                ?.color
                ?.withOpacity(0.64),
              ),
             ),
            Spacer(flex: 3),
            FittedBox(
              child: TextButton(
                onPressed: () => Navigator.push(context,
                  MaterialPageRoute(
                    builder:(context) => LoginPage(),
                ),
              ),
              child: Row(
                children: [
                  Text("Next",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.color
                      ?.withOpacity(0.8)),
                  ),
                SizedBox(width: kDefaultPadding / 4),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Theme.of(context)
                     .textTheme
                     .bodyText1
                     ?.color
                     ?.withOpacity(0.6),
                 )
                ],
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}