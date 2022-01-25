import 'dart:convert';
import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class SignUpPage extends StatefulWidget {

  SignUpPage({Key? key, required this.onFileChanged}): super(key: key);

  final Function(String imageUrl) onFileChanged;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final ImagePicker _picker = ImagePicker();
  String? imageUrl;
  late File? _selectedFile;
  late bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  // padding: EdgeInsets.symmetric(vertical: 5),
                  child: Image.asset(
                'assets/applogo/logo_big.jpg',
                height: 200,
                width: 200,
              )),
              InkWell(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                // constraints: BoxConstraints.expand(),
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
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          suffixIcon: GestureDetector(
                              onTap: () {}, child: Icon(Icons.close)),
                          hintText: '0960000000',
                          labelText: 'Phone Number',
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
                    TextField(
                      obscureText: isVisible,
                      controller: null,
                      onChanged: (value) {
                        print(value);
                      },
                      //
                      decoration: InputDecoration(
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                isVisible = !isVisible;
                                setState(() {});
                              },
                              child: Icon(isVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          hintText: 'type your password',
                          labelText: 'Password',
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
                        'Re-enter Password',
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
                      obscureText: isVisible,
                      controller: null,
                      onChanged: (value) {
                        print(value);
                      },
                      //
                      decoration: InputDecoration(
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                isVisible = !isVisible;
                                setState(() {});
                              },
                              child: Icon(isVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          hintText: 're-enter your password',
                          // labelText: 'Re-enter Password',
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
                    _buildUploadImage(),
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
                    _buildSignupButton(),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
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
        onPressed: () {},
      ),
    );
  }

  Widget _buildUploadImage() {
    return Column(
      children: [
        if (imageUrl == null)
          Icon(
            Icons.image,
            size: 100,
            color: Theme.of(context).primaryColor,
          ),
        if (imageUrl != null)
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => _selectPhoto(),
            child: Image.file(File(_selectedFile!.path), height: 250, fit: BoxFit.contain,),
          ),

        InkWell(
            onTap: () => _selectPhoto(),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                imageUrl != null ? 'Chnage Photo' : 'Choose Fron ID Card',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ))
      ],
    );
  }

  Widget _buildSignupButton() {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
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
          // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
        },
      ),
    );
  }

  Future _selectPhoto() async {
    await showModalBottomSheet(
        context: context,
        builder: (context) => BottomSheet(
            onClosing: () => {},
            builder: (context) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Icon(Icons.camera_alt),
                      title: Text('Camera'),
                      onTap: () {
                        Navigator.of(context).pop();
                        _imagePicker(ImageSource.camera);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.image),
                      title: Text('Gallery'),
                      onTap: () {
                        Navigator.of(context).pop();
                        _imagePicker(ImageSource.gallery);
                      },
                    )
                  ],
                )));
  }

  Future _imagePicker(ImageSource source) async {
    // File pickedFile =
    //     (await _picker.pickImage(source: source, imageQuality: 50)) as File;
    // if (pickedFile == null) {
    //   return;
    // }
    var image = (await _picker.pickImage(source: source, imageQuality: 50));
    if (image == null) return;
    if(image != null){
      var cropped = (await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(
            minimumAspectRatio: 1.0,
          )
      ));

      this.setState((){
        _selectedFile = cropped! as File;
        imageUrl = 'image uploaded';
      });
    } else {
      this.setState((){});
    }
  }

  Future<File?> compressImage(String path, int quality) async {
    final newPath = p.join((await getTemporaryDirectory()).path, '${DateTime.now()}${p.extension(path)}');
    final result = await FlutterImageCompress.compressAndGetFile(path, newPath, quality: quality);
    return result;
  }
}

class ImagePreview extends StatelessWidget {
  final File imageFile;
  const ImagePreview({required this.imageFile, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.file(imageFile),
      ),
    );
  }
}
