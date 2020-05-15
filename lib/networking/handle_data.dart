import 'package:flutter/material.dart';
import 'package:hero_index/widgets/route_animation.dart';
import 'package:hero_index/screens/hero_display_page.dart';
import 'getData.dart';
import 'dart:math';

class HandleData {
  var transition = RouteAnimation();
  void organizeData(context, hero) {
    //Display Screen Data
    final String heroName = hero['name'];
    final String imageName = hero['image']['url'];

//PowerStat Screen Data
    final double strength = hero['powerstats']['strength'] != 'null'
        ? double.parse(hero['powerstats']['strength'])
        : 0;
    final double speed = hero['powerstats']['speed'] != 'null'
        ? double.parse(hero['powerstats']['speed'])
        : 0;

    final double intellect = hero['powerstats']['intelligence'] != 'null'
        ? double.parse(hero['powerstats']['intelligence'])
        : 0;
    final double combat = hero['powerstats']['combat'] != 'null'
        ? double.parse(hero['powerstats']['combat'])
        : 0;
    final double durability = hero['powerstats']['durability'] != 'null'
        ? double.parse(hero['powerstats']['durability'])
        : 0;

//Biography screen Data

    final String fullName = hero['biography']['full-name'] != ''
        ? hero['biography']['full-name']
        : 'Unkown';
    final String birthPlace = hero['biography']['place-of-birth'] != '-'
        ? hero['biography']['place-of-birth']
        : 'Unkown';
    final String firstAppereance = hero['biography']['first-appearance'] != '-'
        ? hero['biography']['first-appearance']
        : 'Unkown';
    final String publisher = hero['biography']['publisher'];
    final String allignment = hero['biography']['alignment'];

    // Appearence Screen Data
    final String gender = hero['appearance']['gender'] != '-'
        ? hero['appearance']['gender']
        : 'Unkown';
    final String race = hero['appearance']['race'] != 'null'
        ? hero['appearance']['race']
        : 'Unkown';
    final String height = hero['appearance']['height'][1] != '0 cm'
        ? hero['appearance']['height'][1]
        : 'Unkown';
    final String weight = hero['appearance']['weight'][1] != '0 kg'
        ? hero['appearance']['weight'][1]
        : 'Unkown';
    final String eye = hero['appearance']['eye-color'] != '-'
        ? hero['appearance']['eye-color']
        : 'Unkown';
    final String hair = hero['appearance']['hair-color'] != '-'
        ? hero['appearance']['hair-color']
        : 'Unkown';

    //Work Screen Data

    final String work = hero['work']['occupation'] != '-'
        ? hero['work']['occupation']
        : 'Unkown';
    final String base =
        hero['work']['base'] != '-' ? hero['work']['base'] : 'Unkown';

    //Connection Page Data
    final String group = hero['connections']['group-affiliation'] != '-'
        ? hero['connections']['group-affiliation']
        : 'Unkown';
    final String relatives = hero['connections']['relatives'] != '-'
        ? hero['connections']['relatives']
        : 'Unkown';

    Navigator.of(context).push(transition.createRoute(DisplayPage(
      name: heroName,
      image: imageName,
      strength: strength,
      speed: speed,
      intellect: intellect,
      combat: combat,
      durability: durability,
      fullName: fullName,
      birthPlace: birthPlace,
      firstAppearance: firstAppereance,
      publisher: publisher,
      alignment: allignment,
      gender: gender,
      race: race,
      height: height,
      weight: weight,
      eye: eye,
      hair: hair,
      base: base,
      work: work,
      group: group,
      relatives: relatives,
    )));
  }
}
