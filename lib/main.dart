import 'package:flutter/material.dart';
import 'package:apod/screens/home.dart';
import 'package:apod/screens/stars.dart';
import 'package:apod/screens/infos.dart';
import 'package:apod/screens/urls.dart';
import 'package:apod/screens/about.dart';


void main() => runApp(new mainApp());

class mainApp extends StatefulWidget {
  @override
  myApp createState() => new myApp();
}

class myApp extends State<mainApp> {
  @override
  Widget build (BuildContext context) {
    return new MaterialApp(
      title: "APOD",
      routes: <String, WidgetBuilder> {
        '/Home' : (BuildContext context) => new Home(),
        '/Stars' : (BuildContext context) => new Stars(),
        '/Infos' : (BuildContext context) => new Infos(),
        '/Urls' : (BuildContext context) => new Urls(),
        '/About' : (BuildContext context) => new About(),
      },
      home : new About()
    );
  }  
}