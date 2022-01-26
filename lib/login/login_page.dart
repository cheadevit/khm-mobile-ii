import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/forget_password/forget_password.dart';
import 'package:flutter_blue/signup/signup.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = true;
  late String phone_number, pass;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _phone_number = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  void validate() {
    if(_form.currentState!.validate()) {
      print('Validated');
    } else {
      print('Validated');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
          child: Form(
            key: _form,
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
                  TextFormField(
                    controller: _phone_number,
                      keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone number is required';
                      }
                      return null;
                    },
                    onChanged: (String value){
                      phone_number = value;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        suffixIcon: (_phone_number.value == null)
                            ? Text('')
                            : GestureDetector(
                            onTap: () {
                              _phone_number.clear();
                            },
                            child: Icon(Icons.close)
                        ),
                        hintText: 'Enter Your Phone Number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.red, width: 1))),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Password',
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
                  TextFormField(
                    obscureText: isVisible,
                    controller: _pass,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                    onChanged: (String value){
                      pass = value;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              isVisible = !isVisible;
                              setState(() {});
                            },
                            child: Icon(isVisible
                                ? Icons.visibility_off
                                : Icons.visibility)),
                        hintText: 'Enter your password',
                        // labelText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.red, width: 1))),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  _buildForgotPasswordButton(),
                  const SizedBox(
                    height: 1,
                  ),
                  _buildLoginButton(),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        'By continuing, you agree to accept our \n\n Privacy Policy & Terms of Service.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, height: 0.8),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Divider(
                      color: Colors.grey,
                      height: 1,
                    ),
                  ),
                  _buildSignupButton()
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }

  Widget _buildForgotPasswordButton() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ForgetPasswordPage(
                      // onFileChanged: (String imageUrl) {},
                      )));
        },
      ),
    );
  }

  Widget _buildLoginButton() {
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
          'LOGIN',
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          validate();
        },
      ),
    );
  }

  Widget _buildSignupButton() {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color(0xFF1A2B7A),
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
          'SIGN UP',
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SignUpPage(
                        onFileChanged: (String imageUrl) {},
                      )));
        },
      ),
    );
  }
}
