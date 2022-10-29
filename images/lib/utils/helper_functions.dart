import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:library_management/pages/admin/admin_book_list_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/book_provider.dart';

Future<bool> setUserLoginStatus(bool status) async{
  final pref = await SharedPreferences.getInstance();
  return pref.setBool('login', status);
}

Future<bool> getUserLoginStatus() async{
  final pref = await SharedPreferences.getInstance();
  return pref.getBool('login') ?? false;
}

Future<bool> setAdminLoginStatus(bool status) async{
  final pref = await SharedPreferences.getInstance();
  return pref.setBool('login', status);
}

Future<bool> getAdminLoginStatus() async{
  final pref = await SharedPreferences.getInstance();
  return pref.getBool('login') ?? false;

}
// const userId = 'userId';
// const adminId = 'adminId';

// Future<bool> setAdminId(int id) async {
//   final pref = await SharedPreferences.getInstance();
//   return pref.setInt(adminId, id);
// }
//
// Future<int> getAdminId() async {
//   final pref = await SharedPreferences.getInstance();
//   return pref.getInt(adminId) ?? 0;
// }

void showMsg(BuildContext context, String msg) =>
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));

String getFormattedDate(DateTime dateTime, String pattern) {
  return DateFormat(pattern).format(dateTime);
}

void deleteBook(BuildContext context, int id, BookProvider provider) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Delete this book'),
      content: const Text('Are you sure to delete this book?'),
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
            provider.deleteBook(id).then((value) {
              Navigator.pushReplacementNamed(context, AdminBookListPage.routeName);
              provider.getAllBooks();
            });
          },
          child: const Text("Yes"),
        ),
      ],
    ),
  );
}