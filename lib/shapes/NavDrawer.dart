import 'package:flutter/material.dart';
import 'package:winwatt_genius_01/pages/ProfilePage.dart';
import 'package:winwatt_genius_01/pages/SettingsPage.dart';

//Navigation drawer
//Vanbilsen, B. Flutter SDK Tutorial - Building a Beautiful Sliding Side Menu Using a Drawer
//https://youtu.be/WqpV_w6lioA?t=1
//Geraadpleegd in April 2019

//Hier wordt de navigatie drawer gedefinieerd.
class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
              accountName: new Text("Gill Steens"),
              accountEmail: new Text("gill.steens@winwatt.eu"),

              decoration: new BoxDecoration(
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/category/products.jpg"),
                  )
              )
          ),
          new ListTile(
            title: new Text("Settings"),
            trailing: new Icon(Icons.settings),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage()));
            },

          ),
          new ListTile(
            title: new Text("Profile"),
            trailing: new Icon(Icons.account_circle),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ProfilePage()));
            },
          ),
          new ListTile(
            title: new Text("Close"),
            trailing: new Icon(Icons.cancel),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
