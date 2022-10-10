import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:slide1/notepad/node_readers.dart';
import 'package:slide1/notepad/note_editor.dart';
import 'package:slide1/widgets/note_card.dart';


class notepad extends StatefulWidget {
  const notepad ({Key key}) : super(key: key);
  @override
  _notepadState  createState() => _notepadState();
}

class _notepadState extends State<notepad>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Notepad'),
        backgroundColor: Colors.cyan[600],
        elevation: 0,
      ),
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Semua catatan",
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("notes").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(snapshot.hasData){
                    return GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      children:
                      snapshot.data.docs
                          .map((note) => noteCard(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder:(context)=>
                                NoteReaderScreen(note),
                            )
                        );
                      }, note)).toList(),
                    );
                  }
                  return Text("thers no Notes",style: GoogleFonts.nunito(
                      color: Colors.black),
                  );
                },
              ),

            )
          ],
          // child: Lottie.network('https://assets4.lottiefiles.com/packages/lf20_k8g1pfs6.json'),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> noteEditor()));
        },
        label: Text("Add Note"),
        icon: Icon(Icons.add),
      ),
    );
  }
}