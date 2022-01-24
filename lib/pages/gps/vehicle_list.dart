import 'dart:ui';

import 'package:flutter/material.dart';

class VehicleList extends StatelessWidget {
  const VehicleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFB0BEC5),
        body: Stack(children: <Widget>[
          SingleChildScrollView(
            // scrollDirection: Axis.vertical,
            child: Card(
              child: Padding(
                padding: EdgeInsets.only(top: 2),
                child: Column(
                  children: [
                    Container(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'BMW 428i 2015',
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Icon(Icons.share),
                                Icon(Icons.more_vert),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // margin: EdgeInsets.only(top: 10),
                    ),
                    Container(
                      height: 200,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/picture10.jpeg'),
                              )),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1.4,
                      color: Colors.grey[200],
                      indent: 10.2,
                      endIndent: 10.2,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () => {},
                            color: Colors.white,
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(Icons.map),
                                Text("Last Location")
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          FlatButton(
                            onPressed: () => {},
                            color: Colors.white,
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  color: Colors.red[300],
                                ),
                                Text("Live Location")
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          FlatButton(
                            onPressed: () => {},
                            color: Colors.white,
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(Icons.play_arrow_sharp,
                                    color: Colors.blue),
                                Text("Play History")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]));
  }
}
