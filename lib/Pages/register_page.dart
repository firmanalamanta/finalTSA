import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget{
  final VoidCallback showLoginPage;
  const RegisterPage ({Key key, this.showLoginPage}) : super(key: key); // kurang required

  @override 
  State<RegisterPage> createState() => _RegisterPageState();

}

class _RegisterPageState extends State<RegisterPage> {
  final _idController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _numberController = TextEditingController();

  // untuk mengecek akun user
  Future SignUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    addUserDetails(
        _idController.text.trim(),
      _emailController.text.trim(),
      _nameController.text.trim(),
      int.parse(_numberController.text.trim()),
    );
  }
  Future addUserDetails(String id, String email, String namalengkap, int number) async{
    await FirebaseFirestore.instance.collection('users').add({
      'id' : id,
      'email' : email,
      'nama' : namalengkap,
      'telepon' : number,
    });
  }

  @override
  void dispose(){
    _idController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _numberController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Image.asset('images/pomi.png'),
            SizedBox(height: 75),
            Text(
              'Hello there.',
              style: GoogleFonts.actor(fontSize: 30),
            ),
            SizedBox(height: 10),
            Text(
              'register below with your email!',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _idController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'NIM',
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 10),

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
                ),
              ),
            ),
            SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Nama Lengkap',
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
                  borderSide: BorderSide(color: Colors.cyan),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Password',
                fillColor: Colors.grey[200],
                filled: true,
                ),
              ),
            ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _numberController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'nomor telepon',
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
                      color: Colors.cyan[600],
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
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('I am a member ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap:widget.showLoginPage,
                    child: Text(
                      'Login now',
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