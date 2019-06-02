import 'package:flutter/material.dart';
import 'package:winwatt_genius_01/pages/GeniusPage.dart';
import 'package:winwatt_genius_01/pages/LeadPage.dart';
import 'package:winwatt_genius_01/pages/LeadPageNew.dart';
import 'package:winwatt_genius_01/pages/SimulationPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedPage = 0;
  final _pageOptions = [
    GeniusPage(),
    SimulationPage(),
    LeadPageNew(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Genius'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.landscape),
              title: Text('Simulation'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              title: Text('Lead'),
            ),
          ]),
    );
  }
}
