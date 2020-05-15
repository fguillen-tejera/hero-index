import 'package:flutter/material.dart';
import 'screens/menu.dart';
import 'package:flutter/services.dart';

void main() => runApp(HeroIndex());

class HeroIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Color(0xFF0A1033),
        appBarTheme: AppBarTheme(
          color: Color(0xFFFF0167),
        ),
        scaffoldBackgroundColor: Color(0xFF0A1033),
      ),
      home: Test(),
    );
  }
}
