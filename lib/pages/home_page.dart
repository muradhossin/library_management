import 'package:flutter/material.dart';
import 'package:library_management/db/db_helper.dart';
import 'package:library_management/pages/admin/admin_login_page.dart';
import 'package:library_management/pages/user/user_login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/homepage';

  @override
  Widget build(BuildContext context) {
    DbHelper.open();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library management system'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, UserLoginPage.routeName);
              },
              child: const Text('Are you looking for books?'),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, AdminLoginPage.routeName);
              },
              child: const Text('Administration panel'),
            ),

          ],
          
        ),
      ),
    );
  }
}
