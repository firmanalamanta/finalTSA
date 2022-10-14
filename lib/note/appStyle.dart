import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle{
  static Color bgColor = Color(0xFFE2E2FE);
  static Color mainColor = Color(0xFF00633);
  static Color accentColor = Color(0xFF0065FF);

  static List<Color> myColor=[
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
  ];

  //static List<Color> cardsColor = [mainColor];
  static TextStyle mainTittle = GoogleFonts.roboto(fontSize: 18.0, fontWeight: FontWeight.bold);


}