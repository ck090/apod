import 'package:flutter/material.dart';
import 'package:apod/code/seperator.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  StateApodCall createState() => new StateApodCall();
}

class StateApodCall extends State<Home> {
  final url = "https://api.nasa.gov/planetary/apod?api_key=vLlGy6Q1lW3IQigJ1LL6TvXrY391eRIdKpBUoijv";
  //final otherurl = "NNKOjkoul8n1CH18TWA9gwngW1s1SmjESPjNoUFo";
  var resBody;
  String imageUrl;
  String imageTitle;
  String imageInfo;
  String imageCredits;

  Future<String> getAPODData() async{
    var res = await http
    .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    this.setState((){
      resBody = json.decode(res.body);
      print(resBody);
      imageUrl = resBody["hdurl"];
      imageTitle = resBody["title"];
      imageInfo = resBody["explanation"];
      imageCredits = resBody["copyright"];
    });

    print(imageUrl);
    print(imageTitle);
    return "Success!!";
  }

  @override
  void initState() {
    this.getAPODData();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [
            const Color(0xFF1ca2e3),
            const Color(0xFF1450a3)
          ],
          begin: const FractionalOffset(1.5, 0.1),
          end: const FractionalOffset(-1.0, 0.9),
          stops: [0.0, 0.5],
          tileMode: TileMode.clamp
        ),
      ),
      child: new Scaffold(
        backgroundColor: Colors.transparent,
        appBar: new AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: new IconButton(
            icon: new Icon(Icons.menu),
            onPressed: () {
              // TODO
            }
          ),
          title: new Text(
            "APOD",
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 30.0
              ),
            ),
        ),
        body: imageUrl != null ? new Stack(
          children: [
            new ListView(
              children: [
                new Padding (
                padding: const EdgeInsets.all(3.0),
                  child: new Card(
                    elevation: 15.0,
                    child: new Column(
                      children: [
                        new Image.network(
                          imageUrl,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: new Card(
                      color: Colors.transparent,
                      elevation: 0.0,
                      child: new Column(
                        children: <Widget>[
                            new Text(
                            imageTitle,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600
                              ),
                              ),
                          new Separator(),
                          new Text(
                              imageInfo,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                color: const Color(0xffC9C3FF),
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600
                                ),
                                ),
                          new Separator(),
                          new Text(
                            "Image Credits : " + imageCredits,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                color: const Color(0xffb6b2df),
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600
                              ),
                          ),
                          new Separator(),
                          new Text(
                            "All credits goes to NASA. Using their APOD API",
                            textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                color: const Color(0xffb6b2df),
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              new Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                child: new FloatingActionButton(
                  child: new Icon(Icons.star),
                  elevation: 20.0,
                  highlightElevation: 20.0,
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    // TODO
                    print("HI");
                  },
                ),
              ),
            ],
        ) : new Center(child:new CircularProgressIndicator(
          backgroundColor: const Color(0xFF1A237E),
        )),
      )
    );
  }
}