import 'package:flutter/material.dart';
import 'package:library_management/pages/admin/admin_login_page.dart';
import 'package:library_management/pages/login_page.dart';
import 'package:library_management/pages/user/user_login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, UserLoginPage.routeName);
              },
              child: const Text('User Panel'),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, AdminLoginPage.routeName);
              },
              child: const Text('Admin Panel'),
            ),
          ],
        ),
      ),
    );
  }
}
