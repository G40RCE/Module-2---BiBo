import 'package:BiBo/login_screen.dart';
import 'package:flutter/material.dart';

// Authetication screen will refresh after the splashscreen.
class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Image.asset('assets/images/bibo_authetication_screen.png'),
      Center(
        child: Column(children: <Widget>[
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(color: Color(0xFF37E73E)),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                    minimumSize: Size(350, 40),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ]),
      )
    ]));
  }
}
