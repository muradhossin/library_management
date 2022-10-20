import 'dart:js';

import 'package:flutter/material.dart';
import 'package:library_management/pages/home_page.dart';
import 'package:library_management/pages/login_page.dart';
import 'package:library_management/pages/user_signup.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: UserSignup.routeName,
    routes: {
      HomePage.routeName: (context) => HomePage(),
      LoginPage.routeName: (context) => LoginPage(),
      UserSignup.routeName: (context) => UserSignup(),
    },
  ));
}