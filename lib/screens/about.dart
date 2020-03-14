import 'package:flutter/material.dart';
import 'package:apod/screens/home.dart';
import 'package:apod/code/seperator.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

String selectedUrl = "https://flutter.io";


class About extends StatelessWidget {

  final faceCard = new Container(
    height: 200.0,    
    decoration: new BoxDecoration(
      color: new Color(0xFF333366),
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(  
          color: Colors.black26,
          blurRadius: 10.0,
          offset: new Offset(0.0, 20.0),
        ),
      ],
    ),
    child: new Padding(
      padding: const EdgeInsets.fromLTRB(70.0, 70.0, 70.0, 0.0),
      child: new Card(
          color: Colors.transparent,
          elevation: 0.0,
          child: new Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: new Column(
              children: <Widget>[
                  new Text(
                  "CHANDRA KANTH",
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new Separator(),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: new Row(
                      children: <Widget>[
                        new FloatingActionButton(
                          elevation: 0.0,
                          onPressed: () {
                            new WebviewScaffold(
                              url: selectedUrl,
                              appBar: new AppBar(
                              title: new Text("Widget webview"),
                            ),
                            withZoom: true,
                            withLocalStorage: true,
                            );
                          },
                          backgroundColor: Colors.transparent,
                          child: new Image(
                            image: new AssetImage('images/github.png'),
                            height: 30.0,
                            width: 30.0,
                          ),
                        ),
                        new FloatingActionButton(
                          elevation: 0.0,
                          backgroundColor: Colors.transparent,
                          child: new Image(
                            image: new AssetImage('images/twitter.png'),
                            height: 30.0,
                            width: 30.0,
                          ),
                          onPressed: () {
                            // TODO
                          },
                        ),
                        new FloatingActionButton(
                          elevation: 0.0,
                          backgroundColor: Colors.transparent,
                          child: new Image(
                            image: new AssetImage('images/linkedin.png'),
                            height: 30.0,
                            width: 30.0,
                          ),
                          onPressed: () {
                            // TODO
                          },
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
      ),
    )
  );

  final faceThumbnail = new Container(
    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 200.0),
    alignment: Alignment.center,
    child: new Image(
      image: new AssetImage('images/face2.png'),
      height: 160.0,
      width: 160.0,
    ),
  );

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
            icon: new Icon(Icons.arrow_back_ios),
            onPressed: () {
              // TODO
              new Home();
            }
          ),
          title: new Text(
            "Developer",
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 30.0
              ),
            ),
        ),
        body: new Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
          child: new Stack(
            alignment: Alignment.center,
            children: <Widget>[
              faceCard,
              faceThumbnail,
            ],
          ), 
        ),
      ),
    );
  }
}