import 'dart:math';
import 'package:hero_index/widgets/route_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hero_index/screens/hero_display_page.dart';
import 'package:hero_index/screens/popular_page.dart';
import 'package:hero_index/widgets/reusable_card.dart';
import '../getData.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_admob/firebase_admob.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  //Ad targeting preferences

//  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
//    keywords: <String>['Games', 'Game', 'Marvel', 'Heroes', 'DC'],
//    contentUrl: 'https://flutter.io',
//    birthday: DateTime.now(),
//    childDirected: false,
//    designedForFamilies: false,
//    gender:
//        MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
//    testDevices: <String>[], // Android emulators are considered test devices
//  );

  //Variables
  String searchName = '';
  bool isLoading = false;
  final _text = TextEditingController();
  bool _validate = false;
  String _errorText;
  InterstitialAd _interstitialAd;
  int _adCounter = 0;
  var transition = RouteAnimation();

//  //Make the intersitial ad
//  InterstitialAd createInterstitialAd() {
//    return InterstitialAd(
//      adUnitId: 'ca-app-pub-2635211345987483/7040690223',
//      targetingInfo: targetingInfo,
//      listener: (MobileAdEvent event) {
//        print("InterstitialAd event $event");
//      },
//    );
//  }

//  //Check if we should display ad
//  void checkForAd() {
//    _adCounter++;
//    print(_adCounter);
//
//    if (_adCounter == 10) {
//      _interstitialAd = createInterstitialAd()..load();
//      _adCounter = 0;
//    }
//  }

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
    void organizeData(hero) {
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
      final String firstAppereance =
          hero['biography']['first-appearance'] != '-'
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
      setState(() {
        _errorText = null;
        isLoading = false;
      });
    }

    void recoverDataRandom() async {
      setState(() {
        isLoading = true;
      });
      var randomNumber = Random().nextInt(732);
      var body = await GetData().getDataRandom(randomNumber.toString());
      if (body != 'no internet') {
        _errorText = null;
        organizeData(body);
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
          var hero = body['results'][0];
          organizeData(hero);
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
                      //checkForAd();
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
                          //checkForAd();
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
                    // checkForAd();
                    setState(() {
                      isLoading = true;
                    });

                    var respnse = await GetData().getDataRandom('1');
                    if (respnse != 'no internet') {
                      setState(() {
                        isLoading = false;
                        _errorText = null;
                      });
                      Navigator.of(context)
                          .push(transition.createRoute(PopularPage()));
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
                    //checkForAd();
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
