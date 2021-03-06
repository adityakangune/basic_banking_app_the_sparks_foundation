import '../model/customer.dart';
import 'package:flutter/material.dart';
import '../dbHelper.dart';



class InsertCustomer extends StatefulWidget {
  static const routeNamed = '/transactionDetails';

  @override
  _InsertCustomerState createState() => _InsertCustomerState();
}

class _InsertCustomerState extends State<InsertCustomer> {

final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

String _customerName = '';
double _customerBalance = 0.0;

final _employeeNameController = TextEditingController();
final _employeeBalanceController = TextEditingController();

DBHelper db;

@override
  void initState() {

    db = DBHelper();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(backgroundColor: Colors.blue[900], title: Text('Add a new customer'),),
      body:SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Form(
                key: _formStateKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 50),
                      child:TextFormField(
                        onSaved: (value) {
                          _customerName = value;
                          },
                        keyboardType: TextInputType.name,
                        controller: _employeeNameController,
                        decoration: InputDecoration(
                          focusedBorder: new UnderlineInputBorder(
                            borderSide: new BorderSide(
                              color: Colors.blue[900],
                              width: 2,
                              style: BorderStyle.solid)),
                          labelText: "Name",
                          fillColor: Colors.white,
                          labelStyle: TextStyle(
                          color: Colors.grey,),),
                          ),),

                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child:TextFormField(
                        onSaved: (value) {
                          _customerBalance = double.parse(value);
                          },
                        keyboardType: TextInputType.name,
                        controller: _employeeBalanceController,
                        decoration: InputDecoration(
                          focusedBorder: new UnderlineInputBorder(
                            borderSide: new BorderSide(
                              color: Colors.blue[900],
                              width: 2,
                              style: BorderStyle.solid)),
                          labelText: "Initial Balance",
                          fillColor: Colors.white,
                          labelStyle: TextStyle(
                          color: Colors.grey,),),
                          ),),
                  
                  ],
                ),),
                SizedBox(height: 80,),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: RaisedButton(
                    onPressed: () async{
                        _formStateKey.currentState.save();
                        db.insertCustomer(Customer(id: null, name: _customerName , balance: _customerBalance));
                        _employeeNameController.text = '';
                        _employeeBalanceController.text = 0.0.toString();
                  },

                    color: Colors.blue[900],
                    child: Text('ADD',
                        style: TextStyle(
                          fontSize: 30,
                        color: Colors.white,
                        letterSpacing: 5,
                    )),
                    ),
                ),

    ],),),),);
  }
}