import 'package:flutter/material.dart';
import 'package:flutter_blue/pages/gps/tracking.dart';
import 'package:flutter_blue/pages/cards/waiting_approval.dart';
import 'package:flutter_blue/pages/gps/vehicle_list.dart';
import 'package:flutter_blue/pages/notifications/notification.dart';
import 'package:flutter_blue/pages/item_list.dart';
import 'package:flutter_blue/pages/profile.dart';
import 'package:flutter_blue/pages/about/about_page.dart';
import 'login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: LoginPage(),
      // home: WaitingApproval(),
      // home: VehicleList(),
    );
  }
}

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
    Profile(),
    AboutPage(),
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
      appBar: AppBar(
        title: const Text('Welcome to GMS', style: TextStyle(color: Color(0xFF424242)),),
        iconTheme: IconThemeData(color: Colors.grey[800]),
        backgroundColor: Colors.white,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(15),
        //   ),
        // ),
        // toolbarHeight: 100,
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
                color: Colors.grey[800],
                size: 24.0,
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
                  color: Colors.blue,
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
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            backgroundColor: Colors.blue,
            label: 'GPS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
