import 'package:flutter/material.dart';
import 'package:library_management/pages/admin/admin_book_list_page.dart';
import 'package:library_management/pages/home_page.dart';
import 'package:library_management/pages/user/user_home_page.dart';
import 'package:library_management/providers/user_provider.dart';
import 'package:library_management/utils/helper_functions.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatefulWidget {
  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    redirect();
    super.initState();
  }

  Future<void> redirect() async{
    if(await getUserLoginStatus()){
      Navigator.pushReplacementNamed(context, UserHomePage.routeName);
    }else {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }
    if(await getAdminLoginStatus()){
      Navigator.pushReplacementNamed(context, AdminBookListPage.routeName);
    }else{
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
