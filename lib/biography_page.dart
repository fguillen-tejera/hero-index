import 'package:flutter/material.dart';
import 'package:hero_index/cosume_list_tile.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'more_info_template.dart';

class BiographyPage extends StatelessWidget {
  BiographyPage(
      {this.name,
      this.image,
      this.fullName,
      this.birthPlace,
      this.firstAppearance,
      this.publisher,
      this.alignment});

  final String name;
  final String image;
  final String fullName;
  final String birthPlace;
  final String firstAppearance;
  final String publisher;
  final String alignment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biography'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  icon: FontAwesome5Solid.id_card,
                  mainText: fullName,
                  subtext: 'Full Name',
                ),
                MyCostumListTile(
                  icon: MaterialIcons.location_on,
                  mainText: birthPlace,
                  subtext: 'Place Of Birth',
                ),
                MyCostumListTile(
                  icon: Feather.eye,
                  mainText: firstAppearance,
                  subtext: 'First Appereance',
                ),
                MyCostumListTile(
                  icon: AntDesign.filetext1,
                  mainText: publisher,
                  subtext: 'Publisher',
                ),
                MyCostumListTile(
                  icon: Entypo.text,
                  mainText: alignment,
                  subtext: 'Alignment',
                ),
              ],
            ),
          ),
        ],
      ),
    );
    //);
  }
}
