import 'package:BiBo/dashboard_updated_screen.dart';
import 'package:flutter/Material.dart';

// transitioning to the dashboard screen for updated balanced.
// provided the official receipt of Money Transfer Transaction.
class Successful_Transaction extends StatelessWidget {
  const Successful_Transaction({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          leading: IconButton(
              icon: const Icon(Icons.print, color: Colors.black),
              // print/screenshot receipt feature unavaliable, due to
              // focusing on the basic important option only.
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Feature Unavaliable"),
                        content: Text(
                            "This feature for print receipt is unavaliable at this time."),
                        actions: [
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Continue")),
                        ],
                      );
                    });
              }),
          title: const Text(
            'Confirmation',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Container(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              const Text(
                'Transfer Successful',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              const Text(
                'Sent Summary Details:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Colors.grey,
                child: Container(
                  height: 500,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Account ID  : 027218010234 - Ayashe5053'),
                        const Text('Amount Sent    :   ₱200'),
                        const Text('Message        :   Happy Birthday!'),
                        const Text('Current BiBo Credits  :   ₱99800'),
                        Center(
                          child: Column(
                            children: const [
                              Text('Date of Transaction:'),
                              Text('10/5/2021 - 9:00AM'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20.0)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF37E73E),
                  padding: EdgeInsets.all(15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardUpdated()),
                  );
                },
                child: const Text(
                  'Close',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        )));
  }
}
