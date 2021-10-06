import 'package:BiBo/dashboard_screen.dart';
import 'package:BiBo/transfer_summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// The current user trying to transfer for exact money transfer
// Example: 200 Pesos to transfer from other users.
// cont. With the valid Account ID.
// cont. and the greeting message.

// Note. This is NOT a real time and unaccurate system for Account Balance.

// Mock Prototype purposes only.
class MoneyTransferScreen extends StatefulWidget {
  @override
  _MoneyTransferState createState() => _MoneyTransferState();
}

class _MoneyTransferState extends State<MoneyTransferScreen> {
  TextEditingController aid = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController message = TextEditingController();

  GlobalKey<FormState> _DetailsForm = GlobalKey<FormState>();

  // the whole body of the app with functionalities.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );
              }),
          title: const Text(
            'Money Transfer',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Form(
                    key: _DetailsForm,
                    child: Column(children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(20),
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Please enter on the following details to transfer:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'NOTE: Transfer ranges 1-200000 PHP only.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text("Enter your Account ID:",
                          style: Theme.of(context).textTheme.headline6),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: new Icon(
                              Icons.account_balance,
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
                          ),
                          controller: aid,
                          cursorColor: Color(0xFF37E73E),
                          maxLength: 12,
                          validator: (data) {
                            if (data == null || data.isEmpty) {
                              return 'Please input the Account ID';
                            }
                            if (data.length < 12) {
                              return 'Please input the valid Account ID';
                            }
                            // if the user enters the Account ID.
                            if (aid.text != '027218010234') {
                              return 'You have entered Account ID, is not exist';
                            }
                            return null;
                          },
                        ),
                      ),
                      Text(
                        "Enter your BiBo Credits Amount:",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: new Icon(
                              Icons.money_rounded,
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
                          ),
                          controller: amount,
                          cursorColor: Color(0xFF37E73E),
                          maxLength: 6, // setting the transfer range limit.
                          validator: (data) {
                            if (data == null || data.isEmpty) {
                              return 'Please enter the BiBo credits amount';
                            }
                            // depending on the out of remaining balance account.
                            // Using validator notification, instead of SnackBar.
                            // Sample for a situational, if user enters a
                            // random amount for Money Transfer.
                            if (amount.text == "100200" ||
                                amount.text == "150000") {
                              return 'Not enough balance to proceed.';
                            }
                            // check the transfer limit for the amount to send.
                            if (amount.text == "0" || amount.text == "200000") {
                              return 'Please input ranges 1-200000 PHP only.';
                            }

                            return null;
                          },
                        ),
                      ),
                      Text(
                        "Enter your Message (Optional):",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: new Icon(
                              Icons.message,
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
                          ),
                          controller: message,
                          cursorColor: Color(0xFF37E73E),
                          maxLength: 150,
                        ),
                      ),
                      Center(
                          child: FlatButton(
                        textColor: Colors.white,
                        padding: EdgeInsets.all(15),
                        color: Color(0xFF37E73E),
                        child: Text(
                          'Proceed',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          if (_DetailsForm.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TransferSummary()),
                            );
                          } else {
                            // showing the snackbar, if the user fails to enter invalid information provided.
                            const Message = SnackBar(
                                content: Text(
                                    "You have entered an invalid details, Please try again."));
                            ScaffoldMessenger.of(context).showSnackBar(Message);
                          }
                        },
                      )),
                    ])))));
  }
}
