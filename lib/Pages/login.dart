import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget{
  final VoidCallback showRegisterPage;
  const LoginPage ({Key key, this.showRegisterPage}): super(key: key); // kurang required

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // untuk mengecek akun user
  Future SignIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
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
          child: SingleChildScrollView( // --> fungsi supaya keyboard tidak error
            child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/pomi.png'),
            SizedBox(height: 70),
            Text(
              'Safety first.',
              style: GoogleFonts.actor(fontSize: 30),
            ),
            SizedBox(height: 10),
            Text(
              'contact related parties!',
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
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                    borderRadius: BorderRadius.circular(12),
                  ),
                hintText: 'Email',
                fillColor: Colors.grey[200],
                filled: true,
                ) ,
              ),
            ),
            SizedBox(height: 10),

            //kolom password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan),
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
                onTap: SignIn,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.cyan[600],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  child: Center(
                    child:Text(
                      'SignIn',
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

            //register
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a member? ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                 ),
                ),
                GestureDetector(
                  onTap:widget.showRegisterPage,
                  child: Text(
                  'Register now',
                style: TextStyle(
                  color: Colors.cyan[600],
                  fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ],
            ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}