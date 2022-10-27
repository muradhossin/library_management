import 'package:flutter/material.dart';
import 'package:library_management/models/user_model.dart';
import 'package:library_management/pages/home_page.dart';
import 'package:library_management/pages/login_page.dart';
import 'package:library_management/pages/user/user_login_page.dart';
import 'package:library_management/providers/user_provider.dart';
import 'package:library_management/utils/constants.dart';
import 'package:provider/provider.dart';

class UserSignup extends StatefulWidget {
  const UserSignup({Key? key}) : super(key: key);

  static const String routeName = '/usersignup';

  @override
  State<UserSignup> createState() => _UserSignupState();
}

class _UserSignupState extends State<UserSignup> {
  bool _isObsecure = true;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  String? selectedGender;
  String? selectedType;
  String errMsg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new account'),
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
              if (value == null || value.isEmpty) {
                return 'This field must not be empty';
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: phoneNumberController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: 'Phone Number',
              labelText: 'Phone Number',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field must not be empty';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButtonFormField(
            borderRadius: BorderRadius.circular(20.0),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintText: "Gender",
                labelText: 'Gender'),
            items: genderList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            value: selectedGender,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select gender';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                selectedGender = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: addressController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: 'Address',
              labelText: 'Address',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field must not be empty';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButtonFormField(
            borderRadius: BorderRadius.circular(20.0),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintText: "book genre preference",
                labelText: 'book genre preference'),
            items: bookCategoryList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            value: selectedType,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select category';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                selectedType = value;
              });
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
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field must not be empty';
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
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field must not be empty';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              _authencticate();
            },
            child: const Text("Sign Up"),
          ),
        ),
        SizedBox(height: 10,),
        Text(errMsg),
        ],
      ),
    ),)
    ,
    );
  }

  _authencticate() async {
    final provider = Provider.of<UserProvider>(context, listen: false);
    if (_formKey.currentState!.validate()) {
      final name = nameController.text;
      final email = emailController.text;
      final gender = selectedGender;
      final address = addressController.text;
      final bookPreference = selectedType;
      final phoneNumber = phoneNumberController.text;
      final password = passwordController.text;
      final confirmPassword = confirmPasswordController.text;

      final user = await provider.getUserByEmail(email);
      if (password == confirmPassword) {
        if (user != null) {
          _setErrorMsg('User already exists');
        } else {
          final user = UserModel(
            name: name,
            gender: gender!,
            address: address,
            bookPreference: bookPreference!,
            phoneNumber: phoneNumber,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
          );
          provider.insertNewUser(user);
          Navigator.pushReplacementNamed(context, UserLoginPage.routeName);
        }
      } else {
        _setErrorMsg('Passwords do not match');
      }
    }
  }

  void _setErrorMsg(String s) {
    setState(() {
      errMsg = s;
    });
  }
}
