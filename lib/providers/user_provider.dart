import 'package:flutter/material.dart';
import 'package:library_management/db/db_helper.dart';
import 'package:library_management/models/user_model.dart';

class UserProvider extends ChangeNotifier{
  late UserModel _userModel;
  UserModel get userModel => _userModel;

  Future<int> insertNewUser(UserModel userModel) {
    return DbHelper.insertUser(userModel);
  }


}