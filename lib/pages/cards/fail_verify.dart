import 'package:flutter/material.dart';

class FailVerify extends StatelessWidget {
  const FailVerify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          child: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Image.asset(
                'assets/applogo/logo_big.jpg',
                height: 200,
                width: 200,
              )),
          Center(
            child: Text(
              'Verification Fail, Please contact to Our support!',
              style: TextStyle(color: Colors.red[400], fontSize: 14),
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
          )
        ],
      )),
    );
  }
}
