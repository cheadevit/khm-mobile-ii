import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_blue/pages/gps/tracking.dart';
import 'package:flutter_blue/pages/history/play_history.dart';
import 'package:flutter_blue/pages/last_location/last_location.dart';

class VehicleList extends StatelessWidget {
  const VehicleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFB0BEC5),
        body: Stack(children: <Widget>[
          SingleChildScrollView(
              // scrollDirection: Axis.vertical,
              child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                VehicleCard(),
                SizedBox(
                  height: 10,
                ),
                VehicleCard(),
                SizedBox(
                  height: 10,
                ),
                VehicleCard(),
              ],
            ),
          ))
        ]));
  }
}

class VehicleCard extends StatelessWidget {
  const VehicleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
                padding: EdgeInsets.only(
                    left: 15.0, top: 10.0, bottom: 15.0, right: 15.0),
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
                  TextButton(
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LastLocationPage()))
                    },
                    // color: Colors.white,
                    // padding: EdgeInsets.all(10.0),
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
                  TextButton(
                    onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Tracking()))
                    },
                    // color: Colors.white,
                    // padding: EdgeInsets.all(10.0),
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
                  TextButton(
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlayHistoryPage()))
                    },
                    // color: Colors.white,
                    // padding: EdgeInsets.all(10.0),
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(Icons.play_arrow_sharp, color: Colors.blue),
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
    );
  }
}
