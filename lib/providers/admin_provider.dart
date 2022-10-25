import 'package:flutter/material.dart';
import 'package:library_management/models/admin_model.dart';

import '../db/db_helper.dart';
import '../models/user_model.dart';

class AdminProvider extends ChangeNotifier{
  late AdminModel _adminModel;
  AdminModel get adminModel => _adminModel;

  Future<AdminModel?> getAdminByEmail(String email) {
    return DbHelper.getAdminByEmail(email);
  }

  Future<void> getAdminById(int id) async {
    _adminModel = await DbHelper.getAdminById(id);
  }

  Future<int> insertNewAdmin(AdminModel adminModel) {
    return DbHelper.insertAdmin(adminModel);
  }
}