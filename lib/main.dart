import 'dart:js';

import 'package:flutter/material.dart';
import 'package:library_management/pages/admin_signup.dart';
import 'package:library_management/pages/home_page.dart';
import 'package:library_management/pages/login_page.dart';
import 'package:library_management/pages/user_home_page.dart';
import 'package:library_management/pages/user_signup.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: UserHomePage.routeName,
    routes: {
      HomePage.routeName: (context) => HomePage(),
      LoginPage.routeName: (context) => LoginPage(),
      UserSignup.routeName: (context) => UserSignup(),
      AdminSignup.routeName: (context) => AdminSignup(),
      UserHomePage.routeName: (context) => UserHomePage(),
    },
  ));
}