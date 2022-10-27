


import 'package:flutter/material.dart';
import 'package:library_management/pages/admin/admin_book_info_page.dart';
import 'package:library_management/pages/admin/admin_book_list_page.dart';
import 'package:library_management/pages/admin/admin_home_page.dart';
import 'package:library_management/pages/admin/admin_login_page.dart';
import 'package:library_management/pages/admin/admin_signup.dart';
import 'package:library_management/pages/admin/new_book_add.dart';
import 'package:library_management/pages/home_page.dart';
import 'package:library_management/pages/login_page.dart';
import 'package:library_management/pages/user/book_info_page.dart';
import 'package:library_management/pages/user/booking_book_page.dart';
import 'package:library_management/pages/user/user_home_page.dart';
import 'package:library_management/pages/user/user_login_page.dart';
import 'package:library_management/pages/user/user_signup.dart';
import 'package:library_management/providers/admin_provider.dart';
import 'package:library_management/providers/book_provider.dart';
import 'package:library_management/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
      ChangeNotifierProvider(create: (context) => AdminProvider()),
      ChangeNotifierProvider(create: (context) => BookProvider()),

    ],
    child: const MyApp(),
  ));
  }

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        // LoginPage.routeName: (context) => LoginPage(),
        UserSignup.routeName: (context) => UserSignup(),
        AdminSignup.routeName: (context) => AdminSignup(),
        UserHomePage.routeName: (context) => UserHomePage(),
        BookInfoPage.routeName: (context) => BookInfoPage(),
        BookingBookPage.routeName: (context) => BookingBookPage(),
        AdminHomePage.routeName: (context) => AdminHomePage(),
        AdminBookListPage.routeName: (context) => AdminBookListPage(),
        AdminBookInfoPage.routeName: (context) => AdminBookInfoPage(),
        UserLoginPage.routeName: (context) => UserLoginPage(),
        AdminLoginPage.routeName: (context) => AdminLoginPage(),
        NewBookAdd.routeName: (context) => NewBookAdd(),
      },
    );
  }
}