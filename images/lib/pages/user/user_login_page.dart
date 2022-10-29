import 'package:flutter/material.dart';
import 'package:library_management/pages/admin/admin_signup.dart';
import 'package:library_management/pages/user/user_home_page.dart';
import 'package:library_management/pages/user/user_signup.dart';
import 'package:library_management/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sql.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  static const String routeName = '/userloginpage';

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  bool _isObsecure = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String errMsg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Login Page'),
      ),
      body: Center(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: "Enter your email",
                    labelText: "Enter your email",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: _isObsecure,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: "Enter your password",
                    labelText: "Enter your password",
                    suffixIcon: IconButton(
                      icon: Icon(_isObsecure
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObsecure = !_isObsecure;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _authenticate();
                      },
                      child: const Text('Login'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, UserSignup.routeName);
                      },
                      child: const Text('Create new account'),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: ElevatedButton(
                  //     onPressed: (){
                  //
                  //     },
                  //     child: const Text('forget password'),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(errMsg),
            ],
          ),
        ),
      ),
    );
  }

  _authenticate() async {
    final provider = Provider.of<UserProvider>(context, listen: false);
    if (_formkey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;

      final user = await provider.getUserByEmail(email);
      if (user == null) {
        _setErrorMsg('User does not exist');
      } else {
        if (password == user.password) {
          Navigator.pushReplacementNamed(
            context,
            UserHomePage.routeName,
            arguments: [user.userId, user.name],
          );
        } else {
          _setErrorMsg('Wrong password');
        }
      }
    }
  }

  void _setErrorMsg(String s) {
    setState(() {
      errMsg = s;
    });
  }
}
