import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MoreInfoTemplate extends StatelessWidget {
  MoreInfoTemplate({this.image, this.name});

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 35),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Hero(
                  tag: '1',
                  child: Container(
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width / 5,
                      backgroundImage: NetworkImage(image),
                    ),
                  ),
                ),
                SizedBox(),
                Hero(
                  tag: '2',
                  child: Container(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width / 2.1,
                        maxWidth: MediaQuery.of(context).size.width / 2.1,
                        minHeight: 30.0,
                        maxHeight: 200.0,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: AutoSizeText(
                          name,
                          textAlign: TextAlign.center,
                          minFontSize: 12,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 100,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
