import 'package:flutter/material.dart';
import 'package:library_management/pages/user/booking_book_page.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import '../pages/user/hired_book.dart';
import '../pages/user/user_login_page.dart';
import '../providers/book_provider.dart';
import '../providers/user_provider.dart';

class DrawerWidget extends StatefulWidget {
  final int id;
  const DrawerWidget({Key? key, required this.id}) : super(key: key);


  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late UserProvider provider;

  @override
  void didChangeDependencies() {
    provider = Provider.of<UserProvider>(context, listen: false);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: provider.getUserById(widget.id),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          final user = snapshot.data;
          return  Drawer(
            elevation: 16,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 8, right: 8, left: 8),
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(user!.name),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(Icons.save),
                    title: Text(
                      'Saved Book',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, HiredBook.routeName, arguments: widget.id);
                    },
                    leading: Icon(Icons.history_rounded),
                    title: Text(
                      'Hired Book',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Log out'),
                          content: const Text('Are you sure?'),
                          actions: [
                            TextButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: const Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushReplacementNamed(context, UserLoginPage.routeName);
                              },
                              child: const Text("Yes"),
                            ),
                          ],
                        ),
                      );
                    },
                    leading: Icon(Icons.logout),
                    title: Text(
                      'Log Out',
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        if(snapshot.hasError){

        }
        return CircularProgressIndicator();
      },

    );
  }
}
