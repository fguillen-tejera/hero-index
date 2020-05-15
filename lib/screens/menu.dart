import 'dart:math';
import 'package:hero_index/widgets/route_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hero_index/screens/popular_page.dart';
import 'package:hero_index/widgets/reusable_card.dart';
import '../networking/getData.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:hero_index/networking/handle_data.dart';

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
  var transition = RouteAnimation();
  var handle = HandleData();

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
        handle.organizeData(context, body);
        setState(() {
          _errorText = null;
          isLoading = false;
        });
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
          handle.organizeData(context, hero);
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
