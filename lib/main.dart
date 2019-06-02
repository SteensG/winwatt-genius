import 'package:flutter/material.dart';
import 'package:winwatt_genius_01/pages/SplashPage.dart';
import 'package:winwatt_genius_01/styles/styles.dart';

void main() => runApp(MyApp());


const TextStyle dropDownLabelStyle =
    TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDownMenuItemStyle =
    TextStyle(color: Colors.black87, fontSize: 14.0);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static Map<int, Color> color = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };

  static MaterialColor colorCustom = MaterialColor(0xFFffa400, color);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WinWatt Genius App Title',
      theme: new ThemeData(
        fontFamily: 'Muli',
        primarySwatch: colorCustom,
        primaryTextTheme: TextTheme(title: Styles.h1),
      ),
      home: SplashPage(),
    );
  }
}
