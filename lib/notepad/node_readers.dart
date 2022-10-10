import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'appStyle.dart';

class NoteReaderScreen extends StatefulWidget{
  NoteReaderScreen(this.doc, {Key key}) : super(key: key);
  QueryDocumentSnapshot doc;
  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen>{
  @override
  Widget build(BuildContext context){
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: AppStyle.myColor[color_id],
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Add a new note",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0), // jarak dari app bar
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["note_title"],
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              widget.doc["creation_date"],
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            SizedBox(height: 18.0),
            Text(
              widget.doc["note_content"],
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}