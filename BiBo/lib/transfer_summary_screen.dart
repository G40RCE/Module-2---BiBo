import 'package:BiBo/money_transfer.dart';
import 'package:BiBo/transfer_successful_screen.dart';
import 'package:flutter/Material.dart';

// Checking the transaction summary before proceed to confirmation.
class TransferSummary extends StatelessWidget {
  const TransferSummary({Key? key}) : super(key: key);
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
                  MaterialPageRoute(
                      builder: (context) => MoneyTransferScreen()),
                );
              }),
          title: const Text(
            'Confirmation',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Transfer Summary',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                // Reviewing details before the transaction has made.
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Account ID: 027218010234 - Ayashe5053'),
                          const Text('Amount: ₱200'),
                          const Text('Message:   Happy Birthday!'),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Are you sure to proceed the transaction?'),
                    Text('This transaction wont redo the process'),
                  ],
                ),
                const Text(
                    'Note: Double check details before doing this transaction.'),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF37E73E),
                    padding: EdgeInsets.all(15),
                  ),
                  onPressed: () {
                    //onpressed it opens a new screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Successful_Transaction()),
                    );
                  },
                  child: const Text(
                    'Proceed',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
