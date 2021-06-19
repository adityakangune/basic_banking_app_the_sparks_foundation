import 'package:bank_app/model/customer.dart';
import 'package:bank_app/widgets/customcard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminDetailsScreen extends StatefulWidget {
  static const routeNamed = '/AdminDetails';

  @override
  _AdminDetailsScreenState createState() => _AdminDetailsScreenState();
}

class _AdminDetailsScreenState extends State<AdminDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var query = ModalRoute.of(context).settings.arguments as Customer;
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        //title: Text(query.name),
        title: Text("Aditya Kangune"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/images/adi-cropped.png"),
            ),
            SizedBox(height: 20,),
            Text(
              "Aditya Kangune",
              style: GoogleFonts.lato(
                fontSize: 40,
                letterSpacing: 5,
                color: Colors.blue[900],
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              color: Colors.grey,
              height: 20,
              thickness: 1,
              endIndent: 30,
              indent: 30,
            ),
            CustomCard(
              icon: Icons.account_box_outlined,
              title: 'Account Number : ${query.id}',
            ),
            CustomCard(
              icon: Icons.account_balance_wallet_sharp,
              //title: 'Balance: ₹ ${query.balance}',
              title: "Balance : ₹ 1,00,000",
            ),
          ],
        ),
      ),
    );
  }
}
