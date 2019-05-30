import 'package:flutter/material.dart';
import 'package:winwatt_genius_01/shapes/NavDrawer.dart';

//https://codingwithjoe.com/building-forms-with-flutter/

class LeadPage extends StatefulWidget {
  @override
  _LeadPageState createState() => _LeadPageState();
}

class _LeadPageState extends State<LeadPage> {

  List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
  String _color = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lead"),
        iconTheme: new IconThemeData(color: Colors.white),
        elevation: 0.0,
      ),
      drawer: NavDrawer(),
      body: SafeArea(
          child: Form(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 24.0),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(Icons.person),
                        hintText: "Enter a name",
                        labelText: "Name *",
                      ),
                    ),
                    SizedBox(height: 24.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(Icons.phone),
                        hintText: "Enter a phone number",
                        labelText: "Phone number *",
                        prefixText: '+32',
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 24.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(Icons.email),
                        hintText: "Enter an email address",
                        labelText: "Email adress*",
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 24.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(Icons.location_on),
                        hintText: "Enter a street",
                        labelText: "Street *",
                      ),
                    ),
                    SizedBox(height: 24.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(Icons.location_on),
                        hintText: "Enter a number",
                        labelText: "Number *",
                      ),
                    ),
                    SizedBox(height: 24.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(Icons.location_on),
                        hintText: "What is his box?",
                        labelText: "Box",
                      ),
                    ),
                    SizedBox(height: 24.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(Icons.location_on),
                        hintText: "What is his postal code?",
                        labelText: "Postal code *",
                      ),
                    ),
                    SizedBox(height: 24.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(Icons.location_on),
                        hintText: "What is his city?",
                        labelText: "City *",
                      ),
                    ),
                    new FormField(
                      builder: (FormFieldState state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            icon: const Icon(Icons.color_lens),
                            labelText: 'Color',
                          ),
                          isEmpty: _color == '',
                          child: new DropdownButtonHideUnderline(
                            child: new DropdownButton(
                              value: _color,
                              isDense: true,
                              onChanged: (String newValue) {
                                setState(() {
                                  
                                  _color = newValue;
                                  state.didChange(newValue);
                                });
                              },
                              items: _colors.map((String value) {
                                return new DropdownMenuItem(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
      )
          )
      )
    );
  }
}

