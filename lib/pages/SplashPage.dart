import 'dart:async';
import 'package:flutter/material.dart';
import 'package:winwatt_genius_01/pages/LoginPage.dart';
import 'package:winwatt_genius_01/styles/Styles.dart';

//Login en splash screen
//Mtechviral. https://www.youtube.com/watch?v=FNBuo-7zg2Q
//https://www.youtube.com/watch?v=FNBuo-7zg2Q
//Geraadpleegd in April 2019

//Deze pagina wordt als eerste geladen.
//Na 3 seconden krijgt men de loginpagina te zien.
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Styles.firstColor, Styles.secondColor])),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/logo.png"),
                      width: 250.0,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 50.0),
                  ),
                  Text("WinWatt Genius",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        )
      ],
    ));
  }
}
