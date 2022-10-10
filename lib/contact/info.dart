import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../warna.dart';
import 'listNumber.dart';

void info(context) {
  Alert(
    context: context,
    title: "Information Employee",
    content: Column(
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 250, minHeight: 200),
          // width: 350,
          // height: 300,
          decoration: BoxDecoration(
          color: Colors.cyan,
            borderRadius: BorderRadius.only(
              topLeft:  Radius.circular(kDefaultPadding),
              topRight:  Radius.circular(kDefaultPadding),
              bottomRight: Radius.circular(kDefaultPadding),
              bottomLeft: Radius.circular(kDefaultPadding),
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                maxRadius: 45,
                minRadius: 45,
                backgroundColor: kContentColorDarkTheme,
                backgroundImage: AssetImage('images/pomi.png'),
              ),
              kWidthSizeBox, //pengatur jarak dengan gambar
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Firman',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    'Departement IT',
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
    buttons: [
      DialogButton(
        onPressed: () => Navigator.pop(context),
        color: Colors.cyan,
        child: Text(
          "Submit",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      )
    ],
  ).show();
}