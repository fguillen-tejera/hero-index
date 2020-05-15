import 'package:flutter/material.dart';
import 'package:hero_index/widgets/cosume_list_tile.dart';
import 'package:hero_index/widgets/more_info_template.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AppereanceScreen extends StatelessWidget {
  AppereanceScreen(
      {this.image,
      this.name,
      this.eye,
      this.weight,
      this.height,
      this.gender,
      this.hair,
      this.race});

  final String image;
  final String name;
  final String gender;
  final String race;
  final String height;
  final String weight;
  final String eye;
  final String hair;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appereance'),
      ),
      body: Column(
        children: <Widget>[
          MoreInfoTemplate(
            image: image,
            name: name,
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                MyListTile(
                  icon: FontAwesome5Solid.transgender,
                  mainText: gender,
                  subtext: 'Gender',
                ),
                MyListTile(
                  icon: MaterialIcons.person,
                  mainText: race,
                  subtext: 'Race',
                ),
                MyListTile(
                  icon: FontAwesome5Solid.ruler_vertical,
                  mainText: height,
                  subtext: 'Height',
                ),
                MyListTile(
                  icon: MaterialCommunityIcons.weight,
                  mainText: weight,
                  subtext: 'Weight',
                ),
                MyListTile(
                  icon: FontAwesome5Solid.eye,
                  mainText: eye,
                  subtext: 'Eye Color',
                ),
                MyListTile(
                  icon: MaterialIcons.color_lens,
                  mainText: hair,
                  subtext: 'Hair Color',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
