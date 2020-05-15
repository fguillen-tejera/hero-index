import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hero_index/hero_display_page.dart';
import 'package:hero_index/popular_page.dart';
import 'getData.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_admob/firebase_admob.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  //Ad targeting preferences

  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['Games', 'Game', 'Marvel', 'Heroes', 'DC'],
    contentUrl: 'https://flutter.io',
    birthday: DateTime.now(),
    childDirected: false,
    designedForFamilies: false,
    gender:
        MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
    testDevices: <String>[], // Android emulators are considered test devices
  );

  //Variables
  String searchName = '';
  bool isLoading = false;
  final _text = TextEditingController();
  bool _validate = false;
  String _errorText;
  InterstitialAd _interstitialAd;
  int _adCounter = 0;

  //Make the intersitial ad
  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: 'ca-app-pub-2635211345987483/7040690223',
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event $event");
      },
    );
  }

  //Check if we should display ad
  void checkForAd() {
    _adCounter++;
    print(_adCounter);

    if (_adCounter == 10) {
      _interstitialAd = createInterstitialAd()..load();
      _adCounter = 0;
    }
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-2635211345987483~5396436064');
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _interstitialAd?.show();

    void recoverDataRandom() async {
      setState(() {
        isLoading = true;
      });

      var randomNumber = Random().nextInt(732);
      var body = await GetData().getDataRandom(randomNumber.toString());
      if (body != 'no internet') {
        _errorText = null;
//Display Screen Data
        final String heroName = body['name'];
        final String imageName = body['image']['url'];

//PowerStat Screen Data
        final double strength = body['powerstats']['strength'] != 'null'
            ? double.parse(body['powerstats']['strength'])
            : 43;
        final double speed = body['powerstats']['speed'] != 'null'
            ? double.parse(body['powerstats']['speed'])
            : 25;

        final double intellect = body['powerstats']['intelligence'] != 'null'
            ? double.parse(body['powerstats']['intelligence'])
            : 33;
        final double combat = body['powerstats']['combat'] != 'null'
            ? double.parse(body['powerstats']['combat'])
            : 27;
        final double durability = body['powerstats']['durability'] != 'null'
            ? double.parse(body['powerstats']['durability'])
            : 50;

//Biography screen Data

        final String fullName = body['biography']['full-name'] != ''
            ? body['biography']['full-name']
            : 'Unkown';
        final String birthPlace = body['biography']['place-of-birth'] != '-'
            ? body['biography']['place-of-birth']
            : 'Unkown';
        final String firstAppereance =
            body['biography']['first-appearance'] != '-'
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
      } else {
        setState(() {
          _errorText = 'Please connect to the internet or try again';
          isLoading = false;
        });
      }
      setState(() {
        isLoading = false;
      });
    }

    void recoverDataByName() async {
      setState(() {
        setState(() {
          _validate ? isLoading = false : isLoading = true;
        });
      });
      var body = await GetData().getDataByName(searchName);
      if (body != 'no internet') {
        if (body['response'] != 'error') {
//Display Screen Data
          final String heroName = body['results'][0]['name'];
          final String imageName = body['results'][0]['image']['url'];

//PowerStat Screen Data
          final double strength =
              body['results'][0]['powerstats']['strength'] != 'null'
                  ? double.parse(body['results'][0]['powerstats']['strength'])
                  : 0;
          final double speed =
              body['results'][0]['powerstats']['speed'] != 'null'
                  ? double.parse(body['results'][0]['powerstats']['speed'])
                  : 0;

          final double intellect = body['results'][0]['powerstats']
                      ['intelligence'] !=
                  'null'
              ? double.parse(body['results'][0]['powerstats']['intelligence'])
              : 0;
          final double combat =
              body['results'][0]['powerstats']['combat'] != 'null'
                  ? double.parse(body['results'][0]['powerstats']['combat'])
                  : 0;
          final double durability =
              body['results'][0]['powerstats']['durability'] != 'null'
                  ? double.parse(body['results'][0]['powerstats']['durability'])
                  : 0;

//Biography screen Data

          final String fullName =
              body['results'][0]['biography']['full-name'] != ''
                  ? body['results'][0]['biography']['full-name']
                  : 'Unkown';
          final String birthPlace =
              body['results'][0]['biography']['place-of-birth'] != '-'
                  ? body['results'][0]['biography']['place-of-birth']
                  : 'Unkown';
          final String firstAppereance =
              body['results'][0]['biography']['first-appearance'] != '-'
                  ? body['results'][0]['biography']['first-appearance']
                  : 'Unkown';
          final String publisher = body['results'][0]['biography']['publisher'];
          final String allignment =
              body['results'][0]['biography']['alignment'];

          // Appearence Screen Data
          final String gender =
              body['results'][0]['appearance']['gender'] != '-'
                  ? body['results'][0]['appearance']['gender']
                  : 'Unkown';
          final String race = body['results'][0]['appearance']['race'] != 'null'
              ? body['results'][0]['appearance']['race']
              : 'Unkown';
          final String height =
              body['results'][0]['appearance']['height'][1] != '0 cm'
                  ? body['results'][0]['appearance']['height'][1]
                  : 'Unkown';
          final String weight =
              body['results'][0]['appearance']['weight'][1] != '0 kg'
                  ? body['results'][0]['appearance']['weight'][1]
                  : 'Unkown';
          final String eye =
              body['results'][0]['appearance']['eye-color'] != '-'
                  ? body['results'][0]['appearance']['eye-color']
                  : 'Unkown';
          final String hair =
              body['results'][0]['appearance']['hair-color'] != '-'
                  ? body['results'][0]['appearance']['hair-color']
                  : 'Unkown';

          //Work Screen Data

          final String work = body['results'][0]['work']['occupation'] != '-'
              ? body['results'][0]['work']['occupation']
              : 'Unkown';
          final String base = body['results'][0]['work']['base'] != '-'
              ? body['results'][0]['work']['base']
              : 'Unkown';

          //Connection Page Data
          final String group =
              body['results'][0]['connections']['group-affiliation'] != '-'
                  ? body['results'][0]['connections']['group-affiliation']
                  : 'Unkown';
          final String relatives =
              body['results'][0]['connections']['relatives'] != '-'
                  ? body['results'][0]['connections']['relatives']
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
            base: base,
            work: work,
            group: group,
            relatives: relatives,
          )));
          setState(() {
            _errorText = null;
            isLoading = false;
          });
        } else {
          setState(() {
            _errorText = 'Sorry! we could not find a match';
            isLoading = false;
          });
        }
      } else {
        setState(() {
          _errorText = 'Please connect to the internet or try again';
          isLoading = false;
        });
      }
    }

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Super Hero Index'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: TextField(
                    controller: _text,
                    onSubmitted: (value) {
                      setState(() {
                        _text.text.isEmpty
                            ? _validate = true
                            : _validate = false;
                      });
                      checkForAd();
                      recoverDataByName();
                    },
                    onChanged: (value) {
                      searchName = value;
                    },
                    decoration: InputDecoration(
                      errorText: _errorText,
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40.0),
                        ),
                      ),
                      hintText: 'Search for a specific Hero/Villain',
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            _text.text.isEmpty
                                ? _validate = true
                                : _validate = false;
                          });
                          checkForAd();
                          recoverDataByName();
                        },
                        child: Icon(
                          Entypo.magnifying_glass,
                          color: Color(0xFFFF0167),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: Image.asset('images/guy2.png'),
                  ),
                ),
                Center(
                    child: SpinKitRing(
                  color: isLoading ? Color(0xff1ed876) : Colors.transparent,
                  size: 150,
                  lineWidth: 15,
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ReusableCard(
                  mainText: 'Popular',
                  subTitle: 'Find the most popular super heroes and villians!',
                  function: () async {
                    checkForAd();
                    setState(() {
                      isLoading = true;
                    });

                    var respnse = await GetData().getDataRandom('1');
                    if (respnse != 'no internet') {
                      setState(() {
                        isLoading = false;
                        _errorText = null;
                      });
                      Navigator.of(context).push(_createRoute(PopularPage()));
                    } else {
                      setState(() {
                        isLoading = false;
                        _errorText = 'Please connect to the internet';
                      });
                    }
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                ReusableCard(
                  mainText: 'Surprise Me',
                  subTitle: 'Discover new super heroes and villains!',
                  function: () {
                    checkForAd();
                    recoverDataRandom();
                  },
                ),
              ],
            ),
            Text(
              'Illustration by Slidesgo from freepik',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({
    this.subTitle,
    this.mainText,
    this.function,
  });

  final String mainText;
  final String subTitle;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: MediaQuery.of(context).size.width / 2.3,
        width: MediaQuery.of(context).size.width / 2.3,
        decoration: BoxDecoration(
            color: Color(0xFF3e4370),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width / 2.5,
                  maxWidth: MediaQuery.of(context).size.width / 2.5,
                  minHeight: 30.0,
                  maxHeight: 200.0,
                ),
                child: AutoSizeText(
                  mainText,
                  maxLines: 1,
                  minFontSize: 20,
                  maxFontSize: 90,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff1ed876),
                      fontSize: 100,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width / 2.5,
                  maxWidth: MediaQuery.of(context).size.width / 2.5,
                  minHeight: 30.0,
                  maxHeight: 200.0,
                ),
                child: AutoSizeText(
                  subTitle,
                  minFontSize: 10,
                  maxFontSize: 80,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 800),
                ),
              ),
            ),
          ],
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
