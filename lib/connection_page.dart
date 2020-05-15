import 'package:flutter/material.dart';
import 'package:hero_index/more_info_template.dart';
import 'package:hero_index/cosume_list_tile.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ConnectionPage extends StatelessWidget {
  ConnectionPage({this.image, this.name, this.group, this.relatives});

  final String image;
  final String name;
  final String group;
  final String relatives;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connections'),
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
                  icon: MaterialIcons.people,
                  mainText: group,
                  subtext: 'Group Affiliation',
                ),
                MyCostumListTile(
                  icon: FontAwesome5Solid.home,
                  mainText: relatives,
                  subtext: 'Relatives',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
