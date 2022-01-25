import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/signup/signup.dart';
import 'package:http/http.dart' as http;

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Image.asset(
                  'assets/applogo/logo_big.jpg',
                  height: 200,
                  width: 200,
                )),
            Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Phone Number',
                          style: TextStyle(
                            fontFamily: 'PT-Sans',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      TextField(
                        controller: phoneNumberController,
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            suffixIcon: phoneNumberController.text.isEmpty
                                ? Text('')
                                : GestureDetector(
                                onTap: () {
                                  phoneNumberController.clear();
                                },
                                child: Icon(Icons.close)),
                            hintText: 'Enter Your Phone Number',
                            // labelText: 'Phone Number',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                BorderSide(color: Colors.red, width: 1))),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      _buildSendResetPassButton(),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }


  Widget _buildSendResetPassButton() {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.blue,
          ),
          elevation: MaterialStateProperty.all(6),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        child: const Text(
          'SEND',
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
