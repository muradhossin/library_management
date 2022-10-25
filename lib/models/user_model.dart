const String tableUser = 'tbl_user';
const String tblUserColId = 'user_id';
const String tblUserColEmail = 'email';
const String tblUserColPassword = 'password';
const String tblUserColConfirmPassword = 'confirm_password';

class UserModel {
  int? userId;
  String email;
  String password;
  String confirmPassword;

  UserModel({
    this.userId,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      tblUserColEmail: email;
      tblUserColPassword: password;
      tblUserColConfirmPassword: confirmPassword;
    };
    if(userId != null){
      map[tblUserColId] = userId;
    }
    return map;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) =>
      UserModel(
        userId: map[tblUserColId],
        email: map[tblUserColEmail],
        password: map[tblUserColPassword],
        confirmPassword: map[tblUserColConfirmPassword],
      );
}
