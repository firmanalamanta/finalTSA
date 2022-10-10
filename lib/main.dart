//import 'package:slide1/theme.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:slide1/Pages/login.dart';
import 'package:slide1/Pages/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:slide1/Pages/welcom_screen.dart';
import 'package:firebase_database/firebase_database.dart';

import 'firebase_options.dart';

void main() async {
  //fungsi menghubungkan App dengan cloud firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomScreen(),
    );
  }
}
//
// class Splashscreen extends StatelessWidget {
//   const Splashscreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//         splash: Column(
//         children: [
//           Image.asset('images/pomi.png'),
//           SizedBox(height: 0.5),
//          Text(
//             "Extension Number List \nand Notes",
//             textAlign: TextAlign.center,
//             style: Theme
//                 .of(context)
//                 .textTheme
//                 .headline5
//                 ?.copyWith(fontWeight: FontWeight.normal),
//           ),
//           //Spacer(),
//           Text(
//             "Zero Accident Requires \n100% Commitment To Satey",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Theme
//                   .of(context)
//                   .textTheme
//                   .bodyText1
//                   ?.color
//                   ?.withOpacity(0.64),
//             ),
//           ),
//         ],
//       ),
//       nextScreen: const MainPage(),
//     );
//       //
//       //splashIconSize: 50,
//       //splashTransition: SplashTransition.slideTransition,
//
//   }
// }

 //title: 'Emergency Notes',
 //theme: lightThemeData(context),
      //darkTheme: darkThemeData(context),
      //themeMode: ThemeMode.system,