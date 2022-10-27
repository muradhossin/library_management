import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../login_page.dart';

class AdminSignup extends StatefulWidget {
  const AdminSignup({Key? key}) : super(key: key);

  static const String routeName = '/adminsignup';

  @override
  State<AdminSignup> createState() => _AdminSignupState();
}

class _AdminSignupState extends State<AdminSignup> {
  bool _isObsecure = true;
  String? imagePath;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:const Text("Sign Up"),
      ),
      body: Form(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: TextFormField(
                style:const TextStyle(
                    color: Colors.black,
                    fontFamily: 'SFUIDisplay'
                ),
                decoration: InputDecoration(
                    hintText: 'Enter Name',
                    labelText: 'Enter Name',
                    labelStyle:const TextStyle(
                        fontSize: 15
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        BorderSide(color: Colors.blue, width: 1))),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'This field must not be empty';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: TextFormField(
                style:const TextStyle(
                    color: Colors.black,
                    fontFamily: 'SFUIDisplay'
                ),
                decoration: InputDecoration(
                    hintText: 'Email Address',
                    labelText: 'Email Address',
                    labelStyle:const TextStyle(
                        fontSize: 15
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                        BorderSide(color: Colors.blue, width: 1))),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'This field must not be empty';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: TextFormField(
                style:const TextStyle(
                    color: Colors.black,
                    fontFamily: 'SFUIDisplay'
                ),
                decoration: InputDecoration(
                    hintText: 'Phone Number',
                    labelText: 'Phone Number',
                    labelStyle:const TextStyle(
                        fontSize: 15
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        BorderSide(color: Colors.blue, width: 1))),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'This field must not be empty';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: TextFormField(
                style:const TextStyle(
                    color: Colors.black,
                    fontFamily: 'SFUIDisplay'
                ),
                decoration: InputDecoration(
                   prefixIcon: Icon(Icons.calendar_today),
                    iconColor: Colors.black, //icon of text field
                    hintText: 'Birth of Date',
                    labelText: 'Birth of Date',
                    labelStyle:const TextStyle(
                        fontSize: 15
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        BorderSide(color: Colors.blue, width: 1))),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'This field must not be empty';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: _isObsecure,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    hintText: 'Password',
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(_isObsecure
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObsecure = !_isObsecure;
                        });
                      },
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: _isObsecure,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    hintText: 'Confirm Password',
                    labelText: 'Confirm Password',
                    suffixIcon: IconButton(
                      icon: Icon(_isObsecure
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObsecure = !_isObsecure;
                        });
                      },
                    )),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'This field must not be empty';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                  hintText: 'admin referral code',
                  labelText: 'admin referral code',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  imagePath == null ? const Icon(Icons.movie, size: 100,) :
                  Image.file(File(imagePath!), width: 100, height: 100, fit: BoxFit.cover,),
                  TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.photo),
                    label: const Text('Select Profile Picture'),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, LoginPage.routeName);
                  },
                  child: const Text("Sign Up"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
