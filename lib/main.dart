import 'dart:js';

import 'package:flutter/material.dart';
import 'package:library_management/pages/admin/admin_book_info_page.dart';
import 'package:library_management/pages/admin/admin_book_list_page.dart';
import 'package:library_management/pages/admin/admin_home_page.dart';
import 'package:library_management/pages/admin/admin_signup.dart';
import 'package:library_management/pages/home_page.dart';
import 'package:library_management/pages/login_page.dart';
import 'package:library_management/pages/user/book_info_page.dart';
import 'package:library_management/pages/user/booking_book_page.dart';
import 'package:library_management/pages/user/user_home_page.dart';
import 'package:library_management/pages/user/user_signup.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AdminBookListPage.routeName,
    routes: {
      HomePage.routeName: (context) => HomePage(),
      LoginPage.routeName: (context) => LoginPage(),
      UserSignup.routeName: (context) => UserSignup(),
      AdminSignup.routeName: (context) => AdminSignup(),
      UserHomePage.routeName: (context) => UserHomePage(),
      BookInfoPage.routeName: (context) => BookInfoPage(),
      BookingBookPage.routeName: (context) => BookingBookPage(),
      AdminHomePage.routeName: (context) => AdminHomePage(),
      AdminBookListPage.routeName: (context) => AdminBookListPage(),
      AdminBookInfoPage.routeName: (context) => AdminBookInfoPage(),
    },
  ));
}