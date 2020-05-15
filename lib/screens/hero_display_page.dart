import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hero_index/screens/appereance_screen.dart';
import 'package:hero_index/screens/biography_page.dart';
import 'package:hero_index/screens/connection_page.dart';
import 'package:hero_index/widgets/info_button.dart';
import 'powerStat_page.dart';
import 'package:hero_index/screens/work_page.dart';
import 'package:hero_index/widgets/route_animation.dart';

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
  var transition = RouteAnimation();
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
                        Navigator.of(context)
                            .push(transition.createRoute(PowerStats(
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
                        Navigator.of(context)
                            .push(transition.createRoute(BiographyPage(
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
                              .push(transition.createRoute(AppereanceScreen(
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
                          Navigator.of(context)
                              .push(transition.createRoute(WorkPage(
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
                              .push(transition.createRoute(ConnectionPage(
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
