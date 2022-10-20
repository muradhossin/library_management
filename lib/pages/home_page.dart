import 'package:flutter/material.dart';

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

              },
              child: const Text('User Panel'),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: (){

              },
              child: const Text('Admin Panel'),
            ),
          ],
        ),
      ),
    );
  }
}
