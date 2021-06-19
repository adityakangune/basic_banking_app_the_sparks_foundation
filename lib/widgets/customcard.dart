import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget
{
  final String title;
  final IconData icon;
  final Function navpage;

  CustomCard({this.icon,this.title, this.navpage});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        color: Colors.blue[900],

        child: ListTile(contentPadding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),),
          leading: Icon(
            icon,
            color: Colors.white,
            size: 60,
          ),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        onTap: navpage,
        ),
      ),
    );
  }

}