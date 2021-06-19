import 'package:bank_app/screens/adminDetails.dart';
import 'package:bank_app/screens/customer_details.dart';
import 'package:bank_app/screens/customers_list.dart';
import 'package:bank_app/screens/insertCustomer.dart';
import 'package:google_fonts/google_fonts.dart';
import './screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ABC Bank Systems',
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        accentColor: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        //textTheme: GoogleFonts.latoTextTheme(
        //Theme.of(context).textTheme,

      ),
      routes: {
        '/' : (ctx) => HomeScreen(),
        CustomersList.routeNamed : (ctx) => CustomersList(),
        InsertCustomer.routeNamed : (ctx) => InsertCustomer(),
        AdminDetailsScreen.routeNamed : (ctx) => AdminDetailsScreen(),
        CustomerDetailsScreen.routeNamed : (ctx) => CustomerDetailsScreen(),
       },
       onUnknownRoute: (settings){
         return MaterialPageRoute(builder: (ctx) => HomeScreen());
       },
    );
  }
}