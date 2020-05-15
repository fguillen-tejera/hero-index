import 'package:flutter/material.dart';

class MyCostumListTile extends StatelessWidget {
  MyCostumListTile({this.subtext, this.icon, this.mainText});

  final String mainText;
  final IconData icon;
  final String subtext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
          size: MediaQuery.of(context).size.width / 15,
        ),
        title: Text(
          mainText,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: MediaQuery.of(context).size.width / 12),
        ),
        subtitle: Text(
          subtext,
          style: TextStyle(
              color: Colors.blueGrey,
              fontSize: MediaQuery.of(context).size.width / 20),
        ),
      ),
    );
  }
}
