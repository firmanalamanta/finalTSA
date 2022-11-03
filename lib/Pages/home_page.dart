import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:slide1/contact/listNumber.dart';
import 'package:slide1/note/homepage.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Emergency Notes'),
        //menonaktifkan tombol back
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey,
        // elevation: 0,
        ),
      body: Stack(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Container(
                      height: 300,
                      child: Lottie.network('https://assets7.lottiefiles.com/packages/lf20_P9ArQ8.json'),
                    ),
                    Text('Congrats! Succes To Register Account \n     Your account : ' + user.email,
                          style: GoogleFonts.actor(fontSize: 20),
                    ),
            Padding(
              //membuat efek cyan melingkar pada homepage
              padding: EdgeInsets.only(top: 15),
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  constraints: BoxConstraints(maxHeight:229, minWidth: 290),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),

                      )),
                child: Column(
              //fungsi pindah ke listnumber
              children: <Widget>[
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextButton(
                    onPressed: () => Navigator.push(context,
                      MaterialPageRoute(
                        builder:(context) => listNumber(),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(13),
                      height: 50,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ), //fungsi membuat box
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("call center",
                            style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.color
                                    ?.withOpacity(0.8)),
                          ),// menampilkan text pada box
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextButton(
                    onPressed: () => Navigator.push(context,
                      MaterialPageRoute(
                        builder:(context) => HomePagee(),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(13),
                      height: 50,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Your Notes",
                            style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.color
                                    ?.withOpacity(0.8)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                MaterialButton(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("SignOut",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.color
                                  ?.withOpacity(0.8)),
                        ),
                      ],
                    )
                  ),
                ],
              ),
                ),
              ),
            ),
              ],
              ),
            ),
          ],
        ),
      );
    }
}
