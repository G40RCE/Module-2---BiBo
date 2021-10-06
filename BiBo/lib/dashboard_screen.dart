import 'package:BiBo/login_screen.dart';
import 'package:flutter/material.dart';
import 'money_transfer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // app bar for the app
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          leading: IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Logout"),
                      content: Text("Are you sure you want to logout?"),
                      actions: [
                        FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                            child: Text("Ok")),
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Cancel")),
                      ],
                    );
                  });
            },
          ),
          title: const Text(
            'My Account',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Feature Unavaliable"),
                        content: Text(
                            "This feature is unavaliable for development prototype sample only."),
                        actions: [
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Continue")),
                        ],
                      );
                    });
              },
            )
          ],
          centerTitle: true,
          elevation: 0,

          // adding the bottom black line for the app bar
          bottom: PreferredSize(
            child: Container(
              color: Colors.black,
              height: 1,
            ),
            preferredSize: const Size.fromHeight(1),
          ),
        ),
        body: Column(
          children: [
            // creating the first card
            Container(
              margin: const EdgeInsets.all(20),
              height: 140,
              decoration: BoxDecoration(
                color: Colors.green.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Hi, There! - Current BiBo Credits:',
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
                        "PHP",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '100,000.00',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // current account id number
            const Text(
              'AID: 029451237894',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              // creating a grid view for the cards
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                // storing the grid views
                children: const [
                  CustomCard(
                    icon: Icons.money,
                    title: 'Money Transfer',
                    color: Colors.red,
                  ),
                  CustomCard(
                    icon: Icons.phone,
                    title: 'Buy Load/Services',
                    color: Colors.yellow,
                  ),
                  CustomCard(
                    icon: Icons.note,
                    title: 'Pay Bills',
                    color: Colors.pink,
                  ),
                  CustomCard(
                    icon: Icons.qr_code,
                    title: 'QR Payment',
                    color: Colors.blueAccent,
                  ),
                  CustomCard(
                    icon: Icons.phone_android_sharp,
                    title: 'Top-Up Credits',
                    color: Colors.greenAccent,
                  ),
                  CustomCard(
                    icon: Icons.attach_money,
                    title: 'Donate Charity',
                    color: Colors.yellow,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// widget to represent a card
class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.icon,
    required this.title,
    required this.color,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MoneyTransferScreen()),
                );
              },
              child: const Text(
                '',
                textAlign: TextAlign.start,
              )),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
