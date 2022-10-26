import 'package:flutter/material.dart';
import 'package:library_management/models/admin_model.dart';
import 'package:library_management/pages/admin/admin_login_page.dart';
import 'package:library_management/providers/admin_provider.dart';
import 'package:library_management/utils/helper_functions.dart';
import 'package:provider/provider.dart';

import '../login_page.dart';

class AdminSignup extends StatefulWidget {
  const AdminSignup({Key? key}) : super(key: key);

  static const String routeName = '/adminsignup';

  @override
  State<AdminSignup> createState() => _AdminSignupState();
}

class _AdminSignupState extends State<AdminSignup> {
  bool _isObsecure = true;
  String errMsg = '';
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  // final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final adminReferralCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'Your Name',
                    labelText: 'Your Name',
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'Email Address',
                    labelText: 'Email Address',
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Email is required';
                    }
                    return null;
                  },
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextFormField(
              //     controller: phoneNumberController,
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(20.0),
              //       ),
              //       hintText: 'Phone Number',
              //       labelText: 'Phone Number',
              //     ),
              //   ),
              // ),
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
                      hintText: 'Password',
                      labelText: 'Password',
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
                    if(value == null || value.isEmpty){
                      return 'Password is required';
                    }
                    return null;
                  },
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: confirmPasswordController,
                  obscureText: _isObsecure,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: 'Confirm Password',
                      labelText: 'Confirm Password',
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
                    if(value == null || value.isEmpty){
                      return 'Confirm Password is required';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: adminReferralCodeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'admin referral code',
                    labelText: 'admin referral code',
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Admin Referral Code is required';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    _authenticate();
                  },
                  child: const Text("Sign Up"),
                ),
              ),
              SizedBox(height: 10,),
              Text(errMsg),
            ],
          ),
        ),
      ),
    );
  }

  _authenticate() async {
    final provider = Provider.of<AdminProvider>(context, listen: false);
    if (_formKey.currentState!.validate()) {
      final name = nameController.text;
      final email = emailController.text;
      // final phoneNumber = phoneNumberController.text;
      final password = passwordController.text;
      final confirmPassword = confirmPasswordController.text;
      final adminReferralCode = adminReferralCodeController.text;

      final admin = await provider.getAdminByEmail(email);
      if(password == confirmPassword){
        if(adminReferralCodeList.contains(adminReferralCode)){
          if (admin != null) {
            _setErrorMsg("Admin already exists");
          } else {
            final admin = AdminModel(
              name: name,
              email: email,
              password: password,
              confirmPassword: confirmPassword,
              referral: adminReferralCode,
            );
            provider.insertNewAdmin(admin);
            Navigator.pushReplacementNamed(context, AdminLoginPage.routeName);
          }
        }else{
          _setErrorMsg('Admin Referral code do not match');
        }
      }else{
        _setErrorMsg('Passwords do not match');
      }

    }
  }

  _setErrorMsg(String msg) {
    setState(() {
      errMsg = msg;
    });
  }
}
