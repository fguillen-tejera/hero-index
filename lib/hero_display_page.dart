import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hero_index/appereance_screen.dart';
import 'package:hero_index/biography_page.dart';
import 'package:hero_index/connection_page.dart';
import 'package:hero_index/edu.dart';
import 'package:hero_index/powerStat_page.dart';
import 'package:hero_index/work_page.dart';

class DisplayPage extends StatefulWidget {
  DisplayPage(
      {this.name,
      this.image,
      this.speed,
      this.combat,
      this.durability,
      this.intellect,
      this.strength,
      this.fullName,
      this.birthPlace,
      this.firstAppearance,
      this.publisher,
      this.alignment,
      this.eye,
      this.weight,
      this.height,
      this.gender,
      this.hair,
      this.race,
      this.base,
      this.work,
      this.relatives,
      this.group});

  final String name;
  final String image;
  final double strength;
  final double speed;
  final double intellect;
  final double combat;
  final double durability;
  final String fullName;
  final String birthPlace;
  final String firstAppearance;
  final String publisher;
  final String alignment;
  final String gender;
  final String race;
  final String height;
  final String weight;
  final String eye;
  final String hair;
  final String work;
  final String base;
  final String group;
  final String relatives;

  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A1033),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Hero(
                  tag: '1',
                  child: Container(
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.3,
                      ),
                      GestureDetector(
                          child: Icon(
                            Icons.event,
                            size: 4,
                            color: Colors.transparent,
                          ),
                          onTap: () {
                            Navigator.of(context).push(_createRoute(Edu()));
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Divider(
                  height: 1,
                  thickness: 3,
                  color: Colors.white,
                ),
                Hero(
                  tag: '2',
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      widget.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: MediaQuery.of(context).size.width / 10),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InfoButton(
                      icon: FontAwesome5Solid.fist_raised,
                      text: 'Power Stats',
                      route: () {
                        Navigator.of(context).push(_createRoute(PowerStats(
                          speed: widget.speed,
                          strength: widget.strength,
                          intellect: widget.intellect,
                          durability: widget.durability,
                          combat: widget.combat,
                          name: widget.name,
                          image: widget.image,
                        )));
                      },
                    ),
                    InfoButton(
                      icon: FontAwesome.book,
                      text: 'Biography',
                      route: () {
                        Navigator.of(context).push(_createRoute(BiographyPage(
                          name: widget.name,
                          image: widget.image,
                          fullName: widget.fullName,
                          birthPlace: widget.birthPlace,
                          firstAppearance: widget.firstAppearance,
                          publisher: widget.publisher,
                          alignment: widget.alignment,
                        )));
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height / 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InfoButton(
                        icon: FontAwesome5Solid.glasses,
                        text: 'Appereance',
                        route: () {
                          Navigator.of(context)
                              .push(_createRoute(AppereanceScreen(
                            gender: widget.gender,
                            race: widget.race,
                            height: widget.height,
                            weight: widget.weight,
                            eye: widget.eye,
                            hair: widget.hair,
                            image: widget.image,
                            name: widget.name,
                          )));
                        },
                      ),
                      InfoButton(
                        icon: FontAwesome.briefcase,
                        text: 'Work',
                        route: () {
                          Navigator.of(context).push(_createRoute(WorkPage(
                            image: widget.image,
                            name: widget.name,
                            base: widget.base,
                            work: widget.work,
                          )));
                        },
                      ),
                      InfoButton(
                        icon: FontAwesome5Solid.link,
                        text: 'Connections',
                        route: () {
                          Navigator.of(context)
                              .push(_createRoute(ConnectionPage(
                            image: widget.image,
                            name: widget.name,
                            group: widget.group,
                            relatives: widget.relatives,
                          )));
                        },
                      ),
                    ],
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

Route _createRoute(var destinationPage) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => destinationPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
