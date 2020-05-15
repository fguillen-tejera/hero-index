import 'package:flutter/material.dart';
import 'getData.dart';
import 'package:hero_index/hero_display_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PopularPage extends StatefulWidget {
  @override
  _PopularPageState createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {
  bool isLoading = false;

  void recoverDataId(String id) async {
    setState(() {
      isLoading = true;
    });

    var body = await GetData().getDataByID(id);
//Display Screen Data
    final String heroName = body['name'];
    final String imageName = body['image']['url'];

//PowerStat Screen Data
    final double strength = body['powerstats']['strength'] != 'null'
        ? double.parse(body['powerstats']['strength'])
        : 0;
    final double speed = body['powerstats']['speed'] != 'null'
        ? double.parse(body['powerstats']['speed'])
        : 0;

    final double intellect = body['powerstats']['intelligence'] != 'null'
        ? double.parse(body['powerstats']['intelligence'])
        : 0;
    final double combat = body['powerstats']['combat'] != 'null'
        ? double.parse(body['powerstats']['combat'])
        : 0;
    final double durability = body['powerstats']['durability'] != 'null'
        ? double.parse(body['powerstats']['durability'])
        : 0;

//Biography screen Data

    final String fullName = body['biography']['full-name'] != ''
        ? body['biography']['full-name']
        : 'Unkown';
    final String birthPlace = body['biography']['place-of-birth'] != '-'
        ? body['biography']['place-of-birth']
        : 'Unkown';
    final String firstAppereance = body['biography']['first-appearance'] != '-'
        ? body['biography']['first-appearance']
        : 'Unkown';
    final String publisher = body['biography']['publisher'];
    final String allignment = body['biography']['alignment'];

    // Appearence Screen Data
    final String gender = body['appearance']['gender'] != '-'
        ? body['appearance']['gender']
        : 'Unkown';
    final String race = body['appearance']['race'] != 'null'
        ? body['appearance']['race']
        : 'Unkown';
    final String height = body['appearance']['height'][1] != '0 cm'
        ? body['appearance']['height'][1]
        : 'Unkown';
    final String weight = body['appearance']['weight'][1] != '0 kg'
        ? body['appearance']['weight'][1]
        : 'Unkown';
    final String eye = body['appearance']['eye-color'] != '-'
        ? body['appearance']['eye-color']
        : 'Unkown';
    final String hair = body['appearance']['hair-color'] != '-'
        ? body['appearance']['hair-color']
        : 'Unkown';

    //Work Page Data

    final String work = body['work']['occupation'] != '-'
        ? body['work']['occupation']
        : 'Unkown';
    final String base =
        body['work']['base'] != '-' ? body['work']['base'] : 'Unkown';

    // Connections Page Data

    final String group = body['connections']['group-affiliation'] != '-'
        ? body['connections']['group-affiliation']
        : 'Unkown';
    final String relatives = body['connections']['relatives'] != '-'
        ? body['connections']['relatives']
        : 'Unkown';

    Navigator.of(context).push(_createRoute(DisplayPage(
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
      work: work,
      base: base,
      group: group,
      relatives: relatives,
    )));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular'),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              HeroCard(
                id: '620',
                onTap: recoverDataId,
                name: 'Spider-Man',
                fullName: 'Peter Parker',
                overlayColor: Colors.blue.withOpacity(0.9),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/133.jpg',
              ),
              HeroCard(
                id: '346',
                onTap: recoverDataId,
                name: 'Ironman',
                fullName: 'Tony Stark',
                overlayColor: Colors.redAccent.withOpacity(0.9),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/85.jpg',
              ),
              HeroCard(
                id: '332',
                onTap: recoverDataId,
                name: 'Hulk',
                fullName: 'Bruce Banner',
                overlayColor: Colors.green.withOpacity(0.9),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/83.jpg',
              ),
              HeroCard(
                id: '70',
                onTap: recoverDataId,
                name: 'Batman',
                fullName: 'Bruce Wayne',
                overlayColor: Colors.black.withOpacity(0.5),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/639.jpg',
              ),
              HeroCard(
                id: '265',
                onTap: recoverDataId,
                name: 'Flash',
                fullName: 'Barry Allen',
                overlayColor: Colors.yellow.withOpacity(0.9),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/892.jpg',
              ),
              HeroCard(
                id: '106',
                onTap: recoverDataId,
                name: 'Black Panther',
                fullName: 'T\'Challa',
                overlayColor: Colors.deepPurpleAccent.withOpacity(0.5),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/247.jpg',
              ),
              HeroCard(
                id: '149',
                onTap: recoverDataId,
                name: 'Captain America',
                fullName: 'Steve Rogers',
                overlayColor: Colors.blue.withOpacity(0.9),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/274.jpg',
              ),
              HeroCard(
                id: '306',
                onTap: recoverDataId,
                name: 'Green Lantern',
                fullName: 'Hal Jordan',
                overlayColor: Colors.green.withOpacity(0.9),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/697.jpg',
              ),
              HeroCard(
                id: '659',
                onTap: recoverDataId,
                name: 'Thor',
                fullName: 'Thor Odinson',
                overlayColor: Colors.blueGrey.withOpacity(0.9),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/140.jpg',
              ),
              HeroCard(
                id: '644',
                onTap: recoverDataId,
                name: 'Superman',
                fullName: 'Clark Kent',
                overlayColor: Colors.redAccent.withOpacity(0.9),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/791.jpg',
              ),
              HeroCard(
                id: '717',
                onTap: recoverDataId,
                name: 'Wolverine',
                fullName: 'Logan',
                overlayColor: Colors.yellow.withOpacity(0.9),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/161.jpg',
              ),
              HeroCard(
                id: '720',
                onTap: recoverDataId,
                name: 'Wonder Woman',
                fullName: 'Diana Prince',
                overlayColor: Colors.blueGrey.withOpacity(0.8),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/807.jpg',
              ),
              HeroCard(
                id: '630',
                onTap: recoverDataId,
                name: 'Star-Lord',
                fullName: 'Peter Quill',
                overlayColor: Colors.yellowAccent.withOpacity(0.9),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/10015.jpg',
              ),
              HeroCard(
                id: '729',
                onTap: recoverDataId,
                name: 'Yoda',
                fullName: 'Jedi',
                overlayColor: Colors.green.withOpacity(0.5),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/10454.jpg',
              ),
              HeroCard(
                id: '655',
                onTap: recoverDataId,
                name: 'Thanos',
                fullName: 'The Mad Titan',
                overlayColor: Colors.deepPurpleAccent.withOpacity(0.9),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/1305.jpg',
              ),
              HeroCard(
                id: '204',
                onTap: recoverDataId,
                name: 'Darkseid',
                fullName: 'Uxas',
                overlayColor: Colors.black.withOpacity(0.5),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/668.jpg',
              ),
              HeroCard(
                id: '414',
                onTap: recoverDataId,
                name: 'Loki',
                fullName: 'God Of Misschief',
                overlayColor: Colors.green.withOpacity(0.9),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/928.jpg',
              ),
              HeroCard(
                id: '273',
                onTap: recoverDataId,
                name: 'Galactus',
                fullName: 'Devourer of Worlds',
                overlayColor: Colors.deepPurpleAccent.withOpacity(0.9),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/862.jpg',
              ),
              HeroCard(
                id: '423',
                onTap: recoverDataId,
                name: 'Magneto',
                fullName: 'Erik Magnus Lensherr',
                overlayColor: Colors.redAccent.withOpacity(0.9),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/12.jpg',
              ),
              HeroCard(
                id: '601',
                onTap: recoverDataId,
                name: 'Sinestro',
                fullName: 'Thaal Sinestro',
                overlayColor: Colors.black.withOpacity(0.5),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/781.jpg',
              ),
              HeroCard(
                id: '370',
                onTap: recoverDataId,
                name: 'Joker',
                fullName: 'Mr. J',
                overlayColor: Colors.deepPurple.withOpacity(0.5),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/719.jpg',
              ),
              HeroCard(
                id: '687',
                onTap: recoverDataId,
                name: 'Venom',
                fullName: 'Eddie Brock',
                overlayColor: Colors.black.withOpacity(0.5),
                image:
                    "https://www.superherodb.com/pictures2/portraits/10/100/22.jpg",
              ),
              HeroCard(
                id: '208',
                onTap: recoverDataId,
                name: 'Darth Vader',
                fullName: 'Anakin Skywalker',
                overlayColor: Colors.redAccent.withOpacity(0.5),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/10444.jpg',
              ),
              HeroCard(
                id: '60',
                onTap: recoverDataId,
                name: 'Bane',
                fullName: '',
                overlayColor: Colors.green.withOpacity(0.8),
                image:
                    'https://www.superherodb.com/pictures2/portraits/10/100/637.jpg',
              )
            ],
          ),
          Center(
            child: SpinKitRing(
              color: isLoading ? Color(0xff1ed876) : Colors.transparent,
              size: 150,
              lineWidth: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class HeroCard extends StatelessWidget {
  HeroCard(
      {this.image,
      this.name,
      this.fullName,
      this.overlayColor,
      this.onTap,
      this.id});

  final String name;
  final String fullName;
  final String image;
  final Color overlayColor;
  final Function onTap;
  final String id;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onTap(id);
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 7,
        child: ListTile(
          subtitle: Text(
            fullName,
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width / 25),
          ),
          title: Text(
            name,
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width / 15,
                fontWeight: FontWeight.bold),
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(overlayColor, BlendMode.multiply),
          ),
        ),
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
