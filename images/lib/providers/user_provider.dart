import 'package:flutter/material.dart';
import 'package:library_management/db/db_helper.dart';
import 'package:library_management/models/user_model.dart';

class UserProvider extends ChangeNotifier{

  Future<int> insertNewUser(UserModel userModel) {
    return DbHelper.insertUser(userModel);
  }


  Future<UserModel?> getUserByEmail(String email) {
    return DbHelper.getUserByEmail(email);
  }

  Future<UserModel> getUserById(int id) async {
    return await DbHelper.getUserById(id);
  }




}