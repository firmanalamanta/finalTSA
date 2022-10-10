import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide1/warna.dart';
import 'package:flutter/material.dart';

Widget noteCard(Function() onTap, QueryDocumentSnapshot doc){
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["note_title"],
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            doc["creation_date"],
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
          SizedBox(height: 4.0),
          Text(doc["note_content"],
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ],
      ),
    ),
  );
}