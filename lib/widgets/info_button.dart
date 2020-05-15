import 'package:flutter/material.dart';

class InfoButton extends StatelessWidget {
  InfoButton({this.icon, this.text, this.route});

  final IconData icon;
  final String text;
  final Function route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              route();
            },
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width / 12,
              backgroundColor: Color(0xFFFF0167),
              child: Icon(
                icon,
                size: MediaQuery.of(context).size.width / 12,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width / 28,
            ),
          ),
        ],
      ),
    );
  }
}
