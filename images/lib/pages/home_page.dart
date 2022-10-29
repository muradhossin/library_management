import 'package:flutter/material.dart';
import 'package:library_management/pages/admin/admin_login_page.dart';
import 'package:library_management/pages/login_page.dart';
import 'package:library_management/pages/user/user_login_page.dart';

class HomePage extends StatelessWidget {
  bool check= true;
  HomePage({Key? key}) : super(key: key);

  static const String routeName = '/homepage';

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/img5.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(

                  primary : Colors.blueGrey,
                  side: BorderSide(color: Colors.amber, width: 1),
                  textStyle: const TextStyle(
                      color: Colors.white, fontSize: 20, fontStyle: FontStyle.normal),
                  shape: BeveledRectangleBorder(

                      borderRadius: BorderRadius.all(Radius.circular(10))),

                ),
                onPressed: (){
                  Navigator.pushNamed(context,UserLoginPage.routeName);
                },
                child: const Text('User Panel'),
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary : Colors.blueGrey,
                  side: BorderSide(color: Colors.amber, width: 1),
                  textStyle: const TextStyle(
                      color: Colors.white, fontSize: 20, fontStyle: FontStyle.normal),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),

                ),
                onPressed: (){
                  Navigator.pushNamed(context, AdminLoginPage.routeName);
                },
                child: const Text('Admin Panel'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
