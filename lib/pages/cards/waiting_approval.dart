import 'package:flutter/material.dart';

class WaitingApproval extends StatelessWidget {
  const WaitingApproval({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFB0BEC5),
        body: Stack(children: <Widget>[
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
                padding: const EdgeInsets.only(top: 15, left: 18, right: 18),
                child: Column(
                  children: [
                    Container(
                      height: 410,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color(333233),
                            offset: Offset(4, 4),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0, 4),
                            blurRadius: 0.5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          Container(
                              padding: EdgeInsets.symmetric(vertical: 25),
                              child: Image.asset(
                                'assets/applogo/logo_big.jpg',
                                height: 200,
                                width: 200,
                              )),
                          Center(
                            child: Text(
                              'Please waiting verification from admin, we will contact to you soon!',
                              style: TextStyle(color: Colors.grey[900], fontSize: 14),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 152, // <-- Your width
                                    height: 48, // <-- Your height
                                    child: RaisedButton.icon(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.phone,
                                        color: Colors.white,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      label: Text(
                                        '023493403',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      color: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  SizedBox(
                                    width: 152,
                                    height: 48,
                                    child: RaisedButton.icon(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.messenger,
                                        color: Colors.white,
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      label: Text(
                                        'Telegrame',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      color: Colors.blue,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      )
    ]));
  }
}
