import 'package:flutter/material.dart';
import 'package:flutter_blue/pages/gps/tracking.dart';
import 'package:flutter_blue/pages/cards/waiting_approval.dart';
import 'package:flutter_blue/pages/gps/vehicle_list.dart';

import 'package:flutter_blue/pages/item_list.dart';
import 'package:flutter_blue/pages/notifications/notification.dart';
import 'package:flutter_blue/pages/profile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _child_screen = [
    VehicleList(),
    Tracking(),
    MarketItem(),
    Profile()
  ];
  final name = 'CHEA Devit';
  final email = 'devit@gmail.com';
  final date = 'Mon/01/2021';
  final urlImage =
      'https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-Image.png';
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        title: const Text('Welcome to GMS'),
        // backgroundColor: Color(0xFF1A2B7A),
        backgroundColor: Colors.blue,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NotificationPage()));
              },
              child: Icon(
                Icons.notifications_active,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Material(
          // color: Color.fromRGBO(50, 75, 205, 1),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF1A2B7A),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(urlImage),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                            const SizedBox(height: 9),
                            Text(
                              email,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            const SizedBox(height: 9),
                            Text(
                              'Date: ' + date,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: null,
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              const SizedBox(height: 24),
              Divider(color: Colors.grey),
              ListTile(
                leading: Icon(Icons.update),
                title: Text('V 1.0.9'),
              ),
            ],
          ),
        ),
      ),

      body: _child_screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12.0,
        // backgroundColor: Color(0xFF1A2B7A),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            backgroundColor: Colors.blue,
            label: 'GPS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            backgroundColor: Colors.blue,
            label: 'Tracking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_sharp),
            label: 'Market',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
