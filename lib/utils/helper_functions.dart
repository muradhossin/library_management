import 'package:shared_preferences/shared_preferences.dart';

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
const userId = 'userId';
const adminId = 'adminId';

Future<bool> setAdminId(int id) async {
  final pref = await SharedPreferences.getInstance();
  return pref.setInt(adminId, id);
}

Future<int> getAdminId() async {
  final pref = await SharedPreferences.getInstance();
  return pref.getInt(adminId) ?? 0;
}

const List<String> adminReferralCodeList = ['ad1001','admin1002','admin1003','admin1004','admin1005'];