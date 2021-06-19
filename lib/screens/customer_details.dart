import 'package:bank_app/screens/modal.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/customcard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomerDetailsScreen extends StatefulWidget {
  static const routeNamed = '/CustomerDetails';

    @override
  _CustomerDetailsScreenState createState() => _CustomerDetailsScreenState();
}

class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var query = ModalRoute.of(context).settings.arguments  as List;
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(backgroundColor: Colors.blue[900],
        title: Text(query[1] + "'s Details"),),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
           CircleAvatar(
             radius : 80,
             backgroundImage: AssetImage("assets/images/customer.jpg",
             ),
             ),
            SizedBox(height :10),
             Text(
               query[1],
               style: GoogleFonts.lato(
                 fontSize: 40,
                 color: Colors.black,),
                ),
                const Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 1,
                  endIndent: 20,
                  indent: 20,
                ),
            SizedBox(height : 20),
                CustomCard(icon: Icons.account_box_outlined,
                  title: 'Account Number : ${query[0]}',
                ),
            SizedBox(height : 5),
                CustomCard(
                  icon: Icons.account_balance_wallet_sharp,
                  title: 'Balance: ₹ ${query[2]}',
                ),
                SizedBox(height : 20),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RawMaterialButton(onPressed: (){
                    showModalBottomSheet(context: context,
                        builder: (ctxt) {
                      return GestureDetector(onTap: () {},
                          child: NewTransaction(
                            customerId: query[0],
                            customerName: query[1],
                            customerBalance: query[2],
                          ),
                          behavior: HitTestBehavior.opaque);
                    }
                    );
                  }, child: Text(
                      'Transfer Money'
                      , style: TextStyle(
                      fontSize: 25,
                      letterSpacing: 5,
                      color: Colors.white
                  )
                  ),
                    splashColor: Colors.green,
                    fillColor: Colors.red[700],
                    padding: const EdgeInsets.all(20.0),
                  ),
                )
          ],
        ),
      ),
    );
  }
}