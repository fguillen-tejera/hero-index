import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({
    this.subTitle,
    this.mainText,
    this.function,
  });

  final String mainText;
  final String subTitle;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: MediaQuery.of(context).size.width / 2.3,
        width: MediaQuery.of(context).size.width / 2.3,
        decoration: BoxDecoration(
            color: Color(0xFF3e4370),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width / 2.5,
                  maxWidth: MediaQuery.of(context).size.width / 2.5,
                  minHeight: 30.0,
                  maxHeight: 200.0,
                ),
                child: AutoSizeText(
                  mainText,
                  maxLines: 1,
                  minFontSize: 20,
                  maxFontSize: 90,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff1ed876),
                      fontSize: 100,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width / 2.5,
                  maxWidth: MediaQuery.of(context).size.width / 2.5,
                  minHeight: 30.0,
                  maxHeight: 200.0,
                ),
                child: AutoSizeText(
                  subTitle,
                  minFontSize: 10,
                  maxFontSize: 80,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 800),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
