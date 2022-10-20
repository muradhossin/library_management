import 'dart:js';

import 'package:flutter/material.dart';
import 'package:library_management/pages/home_page.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: HomePage.routeName,
    routes: {
      HomePage.routeName: (context) => HomePage(),
    },
  ));
}