import 'package:flutter/material.dart';

//Navigation drawer
//Vanbilsen, B. Flutter SDK Tutorial - Building a Beautiful Sliding Side Menu Using a Drawer
//https://youtu.be/WqpV_w6lioA?t=1
//Geraadpleegd in April 2019

//Dit is de settings pagina
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        iconTheme: new IconThemeData(color: Colors.white),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Settings',
              style: Theme.of(context).textTheme.display3,
            ),
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

