import 'package:flutter/material.dart';
import 'package:library_management/pages/admin/admin_book_list_page.dart';
import 'package:library_management/pages/admin/admin_signup.dart';
import 'package:library_management/pages/user/user_home_page.dart';
import 'package:library_management/pages/user/user_signup.dart';

class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  static const String routeName = '/adminloginpage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: "Enter your email",
                  labelText: "Enter your email",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: "Enter your password",
                  labelText: "Enter your password",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, AdminBookListPage.routeName);
                    },
                    child: const Text('Login'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, AdminSignup.routeName);
                    },
                    child: const Text('Create new account'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: (){

                    },
                    child: const Text('forget password'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
