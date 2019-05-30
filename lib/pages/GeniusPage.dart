import 'package:flutter/material.dart';
import 'package:winwatt_genius_01/pages/SearchPage.dart';
import 'package:winwatt_genius_01/shapes/CustomShapeClipper.dart';
import 'package:winwatt_genius_01/shapes/NavDrawer.dart';
import 'package:winwatt_genius_01/main.dart';

List<String> locations = ['Belgium', 'Luxemburg'];



final _searchFieldController = TextEditingController();

class GeniusPage extends StatefulWidget {
  @override
  _GeniusPageState createState() => _GeniusPageState();
}

class _GeniusPageState extends State<GeniusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WinWatt Genius"),
        iconTheme: new IconThemeData(color: Colors.white),
        elevation: 0.0,

      ),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GeniusPageTopPart(),
            GeniusPageBottomPart,
            GeniusPageBottomPart,
          ],
        ),
      ),
    );
  }
}

class GeniusPageTopPart extends StatefulWidget {
  @override
  _GeniusPageTopPartState createState() => _GeniusPageTopPartState();
}

class _GeniusPageTopPartState extends State<GeniusPageTopPart> {
  var selectedLocationIndex = 0;
  var isOptionSelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 350.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [firstColor, secondColor])),
            child: Column(children: <Widget>[
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    SizedBox(width: 16.0),
                    PopupMenuButton(
                        onSelected: (index) {
                          setState(() {
                            selectedLocationIndex = index;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(locations[selectedLocationIndex],
                                style: dropDownLabelStyle),
                            Icon(Icons.keyboard_arrow_down, color: Colors.white)
                          ],
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<int>>[
                              PopupMenuItem(
                                child: Text(locations[0],
                                    style: dropDownMenuItemStyle),
                                value: 0,
                              ),
                              PopupMenuItem(
                                child: Text(locations[1],
                                    style: dropDownMenuItemStyle),
                                value: 1,
                              ),
                            ]),
                    Spacer(),
                    Icon(Icons.settings, color: Colors.white)
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Image.asset(
                'assets/images/logo.png',
                width: 200.0,
              ),
              //SizedBox(height: 30.0),
              //Text("What are you looking for?", style: H2, textAlign: TextAlign.center),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Material(
                  elevation: 100.0,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  child: TextField(
                    controller: _searchFieldController,
                    style: dropDownMenuItemStyle,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "Search",
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 14.0),
                        prefixIcon: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SearchPage(
                                            searchQuery:
                                                _searchFieldController.text)));
                              },
                              child: Icon(Icons.mic, color: Colors.black)),
                        ),
                        suffixIcon: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SearchPage(
                                            searchQuery:
                                                _searchFieldController.text)));
                              },
                              child: Icon(Icons.search, color: Colors.black)),
                        ),
                        border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                    child: ChoiceChip(Icons.text_fields, "Keyword", isOptionSelected),
                    onTap: () {
                      setState(() {
                        isOptionSelected = true;
                      });
                    },
                  ),
                  SizedBox(width: 20.0),
                  InkWell(
                    child: ChoiceChip(
                        Icons.label, "Label", !isOptionSelected),
                    onTap: () {
                      setState(() {
                        isOptionSelected = false;
                      });
                    },
                  ),
                ],
              ),
            ]),
          ),
        )
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  ChoiceChip(this.icon, this.text, this.isSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.all(Radius.circular(20.0)))
          : null,
      child: Row(
        children: <Widget>[
          Icon(widget.icon, size: 20, color: Colors.white),
          SizedBox(width: 8.0),
          Text(widget.text,
              style: TextStyle(color: Colors.white, fontSize: 16.0)),
        ],
      ),
    );
  }
}

const viewAllStyle = TextStyle(fontSize: 14.0, color: firstColor);

var GeniusPageBottomPart = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Categories to discover", style: dropDownMenuItemStyle),
          Spacer(),
          Text("VIEW ALL(12)", style: viewAllStyle),
        ],
      ),
    ),
    Container(
      height: 210.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: categoryCards,
      ),
    )
  ],
);

List<CategoryCard> categoryCards = [
  CategoryCard("assets/images/category/products.jpg", "Products", "lorem1", "10 %",
      "lorem3", "lorem4"),
  CategoryCard("assets/images/category/services.jpg", "Services", "lorem1", "20 %",
      "lorem3", "lorem4"),
  CategoryCard("assets/images/category/salestools.jpg", "Salestools", "lorem 1",
      "30 %", "lorem3", "lorem4"),
  CategoryCard("assets/images/category/best-practices.jpg", "Best Practices", "lorem 1",
      "40 %", "lorem3", "lorem4"),
  CategoryCard("assets/images/category/references.jpg", "References", "lorem 1",
      "50 %", "lorem3", "lorem4"),
  CategoryCard("assets/images/category/legal.jpg", "Legal", "lorem 1",
      "50 %", "lorem3", "lorem4"),
  CategoryCard("assets/images/category/roof.jpg", "Extra", "lorem 1",
      "50 %", "lorem3", "lorem4"),
  //CategoryCard("images/category/bestpractices.jpg", "Best Practices", "lorem1", "lorem2", "lorem3", "lorem4"),
  //CategoryCard("images/category/references.jpg", "References", "lorem1", "lorem2", "lorem3", "lorem4"),
  //CategoryCard("images/category/legal.jpg", "Legal", "lorem1", "lorem2", "lorem3", "lorem4"),
  //CategoryCard("images/category/roof.jpg", "Extra", "lorem1", "lorem2", "lorem3", "lorem4"),
];

class CategoryCard extends StatelessWidget {
  final String imagePath, category, monthYear, discount, oldPrice, newPrice;

  const CategoryCard(this.imagePath, this.category, this.monthYear,
      this.discount, this.oldPrice, this.newPrice);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Stack(
          children: <Widget>[
            Container(
              height: 210.0,
              width: 160.0,
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
            Positioned(
              left: 0.0,
              bottom: 0.0,
              width: 160.0,
              height: 60,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  firstColor.withOpacity(0.8),
                  secondColor.withOpacity(0.8)
                ])),
              ),
            ),
            Positioned(
              left: 10.0,
              bottom: 10.0,
              right: 10.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(category,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18.0)),
                      Text(monthYear,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontSize: 14.0)),
                    ],
                  ),
                  /*Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text(
                        "$discount",
                        style: TextStyle(fontSize: 14.0, color: Colors.black),
                      )),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}