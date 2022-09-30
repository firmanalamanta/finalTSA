import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget{
  const RegisterPage ({Key? key}) : super(key: key);

  @override 
  State<RegisterPage> createState() => _RegisterPageState();

}

class _RegisterPageState extends State<RegisterPage>{
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // untuk mengecek akun user
  Future SignUp() async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      );
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override 
  Widget build(BuildContext context){
        return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Image.asset('images/pomi.png'),
            SizedBox(height: 75),
            Text(
              'Hello There',
              style: GoogleFonts.actor(fontSize: 30),
            ),
            SizedBox(height: 10),
            Text(
              'Register below with your details!',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 50),

            //kolom email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _emailController, 
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                hintText: 'Email',
                fillColor: Colors.grey[200],
                filled: true,
                ),
              ), 
            ),
            SizedBox(height: 10),

            //kolom password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Password',
                fillColor: Colors.grey[200],
                filled: true,
                ),
              ), 
            ),

            //button login
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: GestureDetector(
                onTap: SignUp,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  child: Center(
                    child:Text(
                      'SignUp',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ),
              ),
            ),
            ],
          ),
        ) 
      ),
    );
  }
}