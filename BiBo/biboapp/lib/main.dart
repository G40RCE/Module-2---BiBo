import 'package:BiBo/authetication_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BiBo());
}
// Credits who are contributions for this mobile app project:
// James Matthew N. Avancena
// Cariella Jula E. Hilario
// Ria F. Gutierrez

// BIBO APP - This application is not real-time/accurate.
// DISCLAIMER - This is sample mock prototype purposes only.
// We are not responsible for any mistakes, like wrong codes,
// errors, and complex programming. We are take into a considerations to try
// more explore about becoming professional programmers, currently still on the beginners level.

// Also, it may depends on the actual size of the mobile application.

// Please bear with us....

// Here, are the manuals for the Login Screen:
// BiBo Username: Kevin343
// Password: KevinIsGreat304

// Money Transfer details:
// Account ID: 027218010234
// Amount to Send: 200
// Message: Happy Birthday !

// Thank you, and enjoy your pleasure and explore in our app project.

// for display on the actual splashscreen about the app.
class BiBo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BiBo', debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AuthScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/bibo_startup_screen.png'),
      ),
    );
  }
}
