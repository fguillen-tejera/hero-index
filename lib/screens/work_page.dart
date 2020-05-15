import 'package:flutter/material.dart';
import 'package:hero_index/more_info_template.dart';
import 'package:hero_index/cosume_list_tile.dart';
import 'package:flutter_icons/flutter_icons.dart';

class WorkPage extends StatelessWidget {
  WorkPage({this.image, this.name, this.work, this.base});

  final String image;
  final String name;
  final String work;
  final String base;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work'),
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
                  icon: MaterialIcons.work,
                  mainText: work,
                  subtext: 'Occupation',
                ),
                MyListTile(
                  icon: FontAwesome5Solid.warehouse,
                  mainText: base,
                  subtext: 'Base',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
