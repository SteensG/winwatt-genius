import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:winwatt_genius_01/shapes/NavDrawer.dart';

//https://androidkt.com/http-post-request-in-flutter/

class Lead {
  final String tks_pv;
  final String tks_bat;
  final String tks_ev;
  final String firstname;
  final String lastname;
  final String email;
  final String phone;
  final String lane;
  final String code;
  final String city;
  final String country;
  final String tks_client_type;
  final String tks_timeline;
  final String tks_new_install;
  final String description;
  final String tks_lang;
  final String campaignid;

  Lead(
      {this.tks_pv,
      this.tks_bat,
      this.tks_ev,
      this.firstname,
      this.lastname,
      this.email,
      this.phone,
      this.lane,
      this.code,
      this.city,
      this.country,
      this.tks_client_type,
      this.tks_timeline,
      this.tks_new_install,
      this.description,
      this.tks_lang,
      this.campaignid});

  factory Lead.fromJson(Map<String, dynamic> json) {
    return Lead(
      tks_pv: json['tks_pv'],
      tks_bat: json['tks_bat'],
      tks_ev: json['tks_ev'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      phone: json['phone'],
      lane: json['lane'],
      code: json['code'],
      city: json['city'],
      country: json['country'],
      tks_client_type: json['tks_client_type'],
      tks_timeline: json['tks_timeline'],
      tks_new_install: json['tks_new_install'],
      description: json['description'],
      tks_lang: json['tks_lang'],
      campaignid: json['campaignid'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["tks_pv"] = tks_pv;
    map["tks_bat"] = tks_bat;
    map["tks_ev"] = tks_ev;
    map["firstname"] = firstname;
    map["lastname"] = lastname;
    map["email"] = email;
    map["phone"] = phone;
    map["lane"] = lane;
    map["code"] = code;
    map["city"] = city;
    map["country"] = country;
    map["tks_client_type"] = tks_client_type;
    map["tks_timeline"] = tks_timeline;
    map["tks_new_install"] = tks_new_install;
    map["description"] = description;
    map["tks_lang"] = tks_lang;
    map["campaignid"] = campaignid;

    return map;
  }
}

Future<Lead> createLead(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;
    print("starting");
    if (statusCode < 200 || statusCode > 400 || json == null) {
      print("error");
      throw new Exception("Error while fetching data");
    }
    print("beforesucces");
    return Lead.fromJson(json.decode(response.body));
  });
}

class LeadPage extends StatelessWidget {
  final Future<Lead> lead;

  LeadPage({Key key, this.lead}) : super(key: key);
  static final CRM_URL =
      'http://winwatt.technokrafts.biz/modules/Webforms/tks_captureLead_lampiris.php';
  TextEditingController tks_pv_Controller =
      new TextEditingController(text: "1");
  TextEditingController tks_bat_Controller =
      new TextEditingController(text: "1");
  TextEditingController tks_ev_Controller =
      new TextEditingController(text: "1");
  TextEditingController firstname_Controller =
      new TextEditingController(text: "GeniusFN");
  TextEditingController lastname_Controller =
      new TextEditingController(text: "GeniusLN");
  TextEditingController email_Controller =
      new TextEditingController(text: "genius@gmail.com");
  TextEditingController phone_Controller =
      new TextEditingController(text: "0456112546");
  TextEditingController lane_Controller =
      new TextEditingController(text: "Straat 111");
  TextEditingController code_Controller =
      new TextEditingController(text: "1000");
  TextEditingController city_Controller =
      new TextEditingController(text: "Brussel");
  TextEditingController country_Controller =
      new TextEditingController(text: "België");
  TextEditingController tks_client_type_Controller =
      new TextEditingController(text: "Owner of a house");
  TextEditingController tks_timeline_Controller =
      new TextEditingController(text: "ASAP");
  TextEditingController tks_new_install_Controller =
      new TextEditingController(text: "yes");
  TextEditingController description_Controller =
      new TextEditingController(text: "GeniusDESCRIPTION");
  TextEditingController tks_lang_Controller =
      new TextEditingController(text: "nl");
  TextEditingController campaignid_Controller =
      new TextEditingController(text: "47106");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Simulation"),
          iconTheme: new IconThemeData(color: Colors.white),
          elevation: 0.0,
        ),
        drawer: NavDrawer(),
        body: SingleChildScrollView(
          child: new Container(
            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: new Column(
              children: <Widget>[
                new TextFormField(
                  controller: tks_ev_Controller,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your tks_pv',
                    labelText: 'tks_pv',
                  ),
                ),
                new TextFormField(
                  controller: tks_bat_Controller,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your tks_bat',
                    labelText: 'tks_bat',
                  ),
                ),
                new TextFormField(
                  controller: tks_ev_Controller,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your tks_ev',
                    labelText: 'tks_ev',
                  ),
                ),
                new TextFormField(
                  controller: firstname_Controller,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your firstname',
                    labelText: 'Firstname',
                  ),
                ),
                new TextFormField(
                  controller: lastname_Controller,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your lastname',
                    labelText: 'Lastname',
                  ),
                ),
                new TextFormField(
                  controller: email_Controller,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.email),
                    hintText: 'Enter a email address',
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                new TextFormField(
                  controller: phone_Controller,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.phone),
                    hintText: 'Enter a phone number',
                    labelText: 'Phonenumber',
                  ),
                  keyboardType: TextInputType.phone,
                ),
                new TextFormField(
                  controller: lane_Controller,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your lane',
                    labelText: 'Lane',
                  ),
                ),
                new TextFormField(
                  controller: code_Controller,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your code',
                    labelText: 'Zipcode',
                  ),
                ),
                new TextFormField(
                  controller: city_Controller,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your city',
                    labelText: 'City',
                  ),
                ),
                new TextFormField(
                  controller: country_Controller,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your country',
                    labelText: 'Country',
                  ),
                ),
                new TextFormField(
                  controller: tks_client_type_Controller,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your tks_client_type',
                    labelText: 'tks_client_type',
                  ),
                ),
                new TextFormField(
                  controller: tks_timeline_Controller,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your tks_timeline',
                    labelText: 'tks_timeline',
                  ),
                ),
                new TextFormField(
                  controller: tks_new_install_Controller,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your tks_new_install',
                    labelText: 'tks_new_install',
                  ),
                ),
                new TextFormField(
                  controller: campaignid_Controller,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'enter campaignid',
                    labelText: 'campaginid',
                  ),
                ),
                new RaisedButton(
                  onPressed: () async {
                    Lead newLead = new Lead(
                      tks_pv: tks_pv_Controller.text,
                      tks_bat: tks_bat_Controller.text,
                      tks_ev: tks_ev_Controller.text,
                      firstname: firstname_Controller.text,
                      lastname: lastname_Controller.text,
                      email: email_Controller.text,
                      phone: phone_Controller.text,
                      lane: lane_Controller.text,
                      code: code_Controller.text,
                      city: city_Controller.text,
                      country: country_Controller.text,
                      tks_client_type: tks_client_type_Controller.text,
                      tks_timeline: tks_timeline_Controller.text,
                      tks_new_install: tks_new_install_Controller.text,
                      description: description_Controller.text,
                      tks_lang: tks_lang_Controller.text,
                      campaignid: campaignid_Controller.text,
                    );
                    Lead l = await createLead(CRM_URL, body: newLead.toMap());
                    print(l.firstname);
                  },
                  child: const Text("Create"),
                )
              ],
            ),
          ),
        ));
  }
}
