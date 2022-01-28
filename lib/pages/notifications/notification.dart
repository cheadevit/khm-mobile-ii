import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Notification List'),
      centerTitle: true,
      backgroundColor: Colors.blue,
      // backgroundColor: Color(0xFF1A2B7A),
    ),
  );
}
