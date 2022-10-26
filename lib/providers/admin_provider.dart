import 'package:flutter/material.dart';
import 'package:library_management/models/admin_model.dart';
import 'package:library_management/models/book_model.dart';

import '../db/db_helper.dart';
import '../models/user_model.dart';

class AdminProvider extends ChangeNotifier{

  Future<AdminModel?> getAdminByEmail(String email) {
    return DbHelper.getAdminByEmail(email);
  }

  Future<AdminModel> getAdminById(int id) async {
    return await DbHelper.getAdminById(id);
  }

  Future<int> insertNewAdmin(AdminModel adminModel) {
    return DbHelper.insertAdmin(adminModel);
  }


}