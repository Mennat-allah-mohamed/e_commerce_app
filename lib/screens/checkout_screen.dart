import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkout")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/headphones.png', height: 50),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sony WH–1000XM5", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("\$4.999", style: TextStyle(color: Colors.orange)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text("Select your payment method"),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: Card(child: Padding(padding: EdgeInsets.all(16), child: Text("VISA •••• 1921")))),
                SizedBox(width: 10),
                Expanded(child: Card(child: Padding(padding: EdgeInsets.all(16), child: Text("VISA •••• 5632")))),
              ],
            ),
            SizedBox(height: 20),
            Text("+ Add new", style: TextStyle(color: Colors.grey)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.account_balance_wallet),
                Icon(Icons.apple),
                Icon(Icons.paypal),
              ],
            ),
            Spacer(),
            Text("Subtotal: \$4.999"),
            Text("Shipping: Free"),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, minimumSize: Size(double.infinity, 50)),
              onPressed: () {},
              child: Text("Finalize Purchase"),
            ),
          ],
        ),
      ),
    );
  }
}
