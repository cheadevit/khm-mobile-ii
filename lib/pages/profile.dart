import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0xFFB0BEC5),
        body: Stack(children: <Widget>[
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 15, left: 18, right: 18),
                child: Column(
                  children: [
                    Container(
                      height: 350,
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
                          Center(
                              child: InkWell(
                                  onTap: () {
                                    // onDialogShowImage();
                                    print('onDialogShowImage');
                                  },
                                  child: SizedBox(
                                    height: 115,
                                    width: 115,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      // overflow: Overflow.visible,
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                              AssetImage('assets/no-image.png'),
                                        ),
                                        Positioned(
                                            right: 30,
                                            bottom: 0,
                                            child: SizedBox(
                                              height: 56,
                                              width: 56,
                                              child: FlatButton(
                                                  // color: Colors.grey.withOpacity(0.8),
                                                  onPressed: () {},
                                                  child: Image.asset(
                                                      'assets/cameraicon.png')),
                                            )),
                                      ],
                                    ),
                                  ))),
                          SizedBox(height: 30),
                          Column(
                            children: [
                              Text(
                                'Personal Infomation',
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text('Name: CHEA DEVIT',
                                  style: TextStyle(fontSize: 16)),
                              SizedBox(
                                height: 10,
                              ),
                              Text('ID: 000168',
                                  style: TextStyle(fontSize: 16)),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Phone Number: +885964054519',
                                  style: TextStyle(fontSize: 16)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Padding(padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Text('Security', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            Column(
              children: [
                BottomAction(icon: 'assets/padlock.png', text: 'Change Password', press: () {}),
                SizedBox(height: 10,),
                BottomAction(icon: 'assets/fingerprint-scan.png', text: 'Finger Print', press: () {}),
              ],
            ),
          ],
        ),
      )
    ]));
  }
}

class BottomAction extends StatelessWidget {
  const BottomAction(
      {Key? key, required this.text, required this.icon, required this.press})
      : super(key: key);

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, left: 18, right: 18),
        child: Container(
          height: 70,
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
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Container(
              child: Row(
                children: [
                  Image.asset(icon, width: 25,),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                    text,
                    style: TextStyle(fontSize: 16),
                  )),
                  Icon(
                    Icons.edit_outlined,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
