import 'package:flutter/material.dart';

//Navigation drawer
//Vanbilsen, B. Flutter SDK Tutorial - Building a Beautiful Sliding Side Menu Using a Drawer
//https://youtu.be/WqpV_w6lioA?t=1
//Geraadpleegd in April 2019

//Dit is de profiel pagina
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        iconTheme: new IconThemeData(color: Colors.white),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Profile',
              style: Theme.of(context).textTheme.display3,
            ),
          ],
        ),
      ),
    );
  }
}

