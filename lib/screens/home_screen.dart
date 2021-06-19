import 'package:bank_app/model/customer.dart';
import 'package:bank_app/screens/adminDetails.dart';
import 'package:bank_app/screens/customers_list.dart';
import 'package:bank_app/screens/insertCustomer.dart';
import 'package:bank_app/widgets/customcard.dart';
import 'package:flutter/material.dart';
import '../dbHelper.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Customer> query = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(backgroundColor: Colors.blue[900],
        title: Text(
          'ABC Bank Systems',
              style: GoogleFonts.lato(
                fontSize: 30,
                fontWeight: FontWeight.bold,
      ),
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(icon: Icon(Icons.info), onPressed: () async{
          DBHelper db =  DBHelper();
          query = await db.getCustomer();
          Navigator.of(context).pushNamed(AdminDetailsScreen.routeNamed,
              arguments: query[0]);

        })
      ],),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),),
                elevation: 10,
                margin: EdgeInsets.all(3),
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                  topLeft : Radius.circular(60),
                  topRight : Radius.circular(60),),
                  child: Image(image: AssetImage(
                      "assets/images/bank.jpg"
                  ),
                  height: 250,
                  width: 250,
                  fit: BoxFit.fill,
                  )),
              ),
              SizedBox(height: 10,),
              const Divider(
                color: Colors.grey,
                height: 20,
                thickness: 1,
                endIndent: 30,
                indent: 30,
              ),
              Text(
                "Welcome!",
                style: GoogleFonts.lato(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                  letterSpacing: 20,
                ),
              ),

              const Divider(
                color: Colors.grey,
                height: 20,
                thickness: 1,
                endIndent: 30,
                indent: 30,
              ),
              SizedBox(height : 20),


              CustomCard(
                icon: Icons.account_circle,
                title: 'View All Customers',
                navpage: () async {
                  DBHelper db =  DBHelper();
                  query = await db.getCustomer();
                  Navigator.of(context).pushNamed(
                    CustomersList.routeNamed,
                    arguments: query
                    );
                },
              ),

              SizedBox(height : 20),

              CustomCard(
                icon: Icons.account_balance_rounded,
                title: 'Insert Customer',
                navpage: () {
                  Navigator.of(context).pushNamed(
                    InsertCustomer.routeNamed,
                  );
                },
              ),
            ],
          ),
        ),

      ),
    );
  }
}