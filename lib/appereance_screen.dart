import 'package:flutter/material.dart';
import 'package:hero_index/cosume_list_tile.dart';
import 'package:hero_index/more_info_template.dart';
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
                MyCostumListTile(
                  icon: FontAwesome5Solid.transgender,
                  mainText: gender,
                  subtext: 'Gender',
                ),
                MyCostumListTile(
                  icon: MaterialIcons.person,
                  mainText: race,
                  subtext: 'Race',
                ),
                MyCostumListTile(
                  icon: FontAwesome5Solid.ruler_vertical,
                  mainText: height,
                  subtext: 'Height',
                ),
                MyCostumListTile(
                  icon: MaterialCommunityIcons.weight,
                  mainText: weight,
                  subtext: 'Weight',
                ),
                MyCostumListTile(
                  icon: FontAwesome5Solid.eye,
                  mainText: eye,
                  subtext: 'Eye Color',
                ),
                MyCostumListTile(
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
