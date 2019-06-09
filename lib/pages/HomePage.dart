import 'package:flutter/material.dart';
import 'package:winwatt_genius_01/pages/GeniusPage.dart';
import 'package:winwatt_genius_01/pages/LeadPage.dart';
import 'package:winwatt_genius_01/pages/SimulationPage.dart';

//Bottom navigatie
//Love, G. Adding a Bottom Navigation Bar in Flutter
//https://www.youtube.com/watch?v=n_FRmFm9Tyw
//Geraadpleegd in April, 2019

//Op deze pagina ziet men de structuur voor de navigatie onderaan.
//Men definiëert de 3 verschillende pagina's en welke actief is.
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedPage = 0;
  final _pageOptions = [
    GeniusPage(),
    SimulationPage(),
    LeadPage(),
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
