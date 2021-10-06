import 'package:BiBo/authetication_screen.dart';
import 'package:BiBo/dashboard_screen.dart';
import 'package:flutter/material.dart';

// NOTE: There will be no administrator account for this mobile app.
// This simulates as extra layer of security, for prevention from bypass
// hackers on this account.
class LoginScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  // Text controllers use to identity the correct details.
  TextEditingController _password = TextEditingController();
  TextEditingController username = TextEditingController();

  GlobalKey<FormState> _InputForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthScreen()),
                );
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: Center(
            // using the validator technique for more security reasons.
            child: SingleChildScrollView(
                child: Form(
                    key: _InputForm,
                    child: Column(
                      children: <Widget>[
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(50),
                            child: Image(
                                image: AssetImage(
                                    'assets/images/bibo_login.png'))),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: new Icon(
                                Icons.manage_accounts,
                                color: Color(0xFF37E73E),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xFF37E73E)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xFF37E73E)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              labelStyle: TextStyle(color: Color(0xFF000000)),
                              labelText: 'BiBo Username',
                            ),
                            // make the validator username secured, no bypass the app
                            cursorColor: Color(0xFF37E73E),
                            maxLength: 8,
                            controller: username,
                            validator: (data) {
                              if (data == null || data.isEmpty) {
                                return 'Please enter your username';
                              }
                              if (data.length < 8) {
                                return 'Please enter your valid BiBo username';
                              }
                              // if the user enters the correct username.
                              if (username.text != 'Kevin343') {
                                return 'You have entered an invalid username';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: new Icon(
                                Icons.lock,
                                color: Color(0xFF37E73E),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xFF37E73E)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xFF37E73E)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              labelStyle: TextStyle(color: Color(0xFF000000)),
                              labelText: 'Password',
                            ),
                            // make the validator password secured, no bypass the app
                            cursorColor: Color(0xFF37E73E),
                            maxLength: 16,
                            obscureText: true,
                            controller: _password,
                            validator: (data) {
                              if (data == null || data.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (data.length < 4 || data.length > 16) {
                                return 'Please enter your valid password';
                              }
                              // if the user enters the correct password.
                              if (_password.text != 'KevinIsGreat304') {
                                return 'You have entered an invalid password';
                              }
                              return null;
                            },
                          ),
                        ),
                        // Other features, were not available due to sample prototype reasons,
                        // focused on the other parts of the mobile app.
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Trouble Signing In?'),
                            FlatButton(
                              textColor: Color(0xFF37E73E),
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(fontSize: 20),
                              ),
                              // Verification that all details were correct/wrong.
                              onPressed: () {
                                const Message = SnackBar(
                                    content: Text(
                                        "This feature is unavaliable for development prototype sample only."));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(Message);
                              },
                            )
                          ],
                        )),
                        Container(
                            height: 50,
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: FlatButton(
                              textColor: Colors.white,
                              color: Color(0xFF37E73E),
                              child: Text(
                                'Login',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                if (_InputForm.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DashboardScreen()),
                                  );
                                } else {
                                  // showing the snackbar, if the user fails to enter invalid information provided.
                                  const Message = SnackBar(
                                      content: Text(
                                          "You have entered an invalid details, Please try again."));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(Message);
                                }
                              },
                            )),
                        Container(
                            child: Row(
                          children: <Widget>[
                            Text('No BiBo Account?'),
                            FlatButton(
                              textColor: Color(0xFF37E73E),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                const Message = SnackBar(
                                    content: Text(
                                        "This feature is unavaliable for development prototype sample only."));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(Message);
                              },
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ))
                      ],
                    )))));
  }
}
