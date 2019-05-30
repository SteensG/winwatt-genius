import 'package:flutter/material.dart';
import 'package:winwatt_genius_01/main.dart';
import 'package:winwatt_genius_01/shapes/CustomShapeClipper.dart';

final Color discountBackgroundColor = Color(0xFFFFE08D);
final Color flightBordercolor = Color(0xFFE6E6E6);
final Color chipBackgroundColor = Color(0XFFF6F6F6);

class SearchPage extends StatelessWidget {

  final String searchQuery;

  SearchPage({this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Genius Search"),
        iconTheme: new IconThemeData(color: Colors.white),
        elevation: 0.0,

        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          }
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SearchPageTopPart(searchQuery: searchQuery),
            SearchPageBottomPart(),
          ],
        ),
      ),
    );
  }
}

class SearchPageTopPart extends StatelessWidget {

  final String searchQuery;

  SearchPageTopPart({this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [firstColor, secondColor])),
            height: 160.0,
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 30.0),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("$searchQuery", style: TextStyle(fontSize: 16.0)),
                          /*Divider(
                            color: Colors.grey,
                            height: 20.0,
                          ),
                          Text("Tags",
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold)),*/
                        ],
                      ),
                    ),
                    Spacer(),
                    Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 32.0,
                        )),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class SearchPageBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Search results", style: dropDownMenuItemStyle),
          SizedBox(
            height: 10.0,
          ),
          CategoryCard(),
          CategoryCard(),
          CategoryCard(),
          CategoryCard(),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: flightBordercolor)
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "X22 270 Wp",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      "SunPower",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          decoration: TextDecoration.underline,
                          color: Colors.grey),
                    )
                  ],
                ),
                Wrap(
                  spacing: 8.0,
                  children: <Widget>[
                    TagChip(Icons.brightness_5, 'Product'),
                    TagChip(Icons.brightness_5, 'Solar'),
                    TagChip(Icons.brightness_5, 'Panel'),
                  ],
                )
              ],

            ),
          ),
        )
      ],
    );
  }
}

class TagChip extends StatelessWidget {

  final IconData iconData;
  final String label;

  const TagChip(this.iconData, this.label);

  @override
  Widget build(BuildContext context) {
    return RawChip(
      label: Text(label),
      labelStyle: TextStyle(color: Colors.black),
      backgroundColor: Colors.white,
      avatar: Icon(iconData, color: Colors.orangeAccent),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
    );
  }
}
