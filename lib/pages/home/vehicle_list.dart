import 'package:flutter/material.dart';

class VehicleList extends StatefulWidget {
  const VehicleList({Key? key}) : super(key: key);

  @override
  _VehicleListState createState() => _VehicleListState();
}

class _VehicleListState extends State<VehicleList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.only(top: 15, bottom: 0, left: 15, right: 15),
                child: Column(
                  children: [
                    VehicleListCard(),
                    SizedBox(height: 10,),
                    VehicleListCard(),
                    SizedBox(height: 10,),
                    VehicleListCard(),
                    SizedBox(height: 10,),
                    VehicleListCard(),
                    SizedBox(height: 10,),
                    VehicleListCard(),
                  ]
                ),
              ),
          ),
        ],
      ),
    );
  }
}

class VehicleListCard extends StatelessWidget {
  const VehicleListCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 0.3,
              spreadRadius: 1,
              color: Color(333233333),
            ),
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 0.3,
              spreadRadius: 1,
              color: Color(333233333),
            )
          ]
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color(233011),
                    offset: Offset(4, 4),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              height: 110,
              width: 140,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Image.asset('assets/picture10.jpeg',fit: BoxFit.contain,),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'BMW 493IC 2021',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(Icons.pin_drop_outlined),
                      Text('In Phnom Penh ',
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 16,
                        )
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(Icons.lock_open),
                      Text('Open ',
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 16,
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(Icons.power_settings_new),
                      Text('Driving ',
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 16,
                          )
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}