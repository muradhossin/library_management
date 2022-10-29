const String tableUser = 'tbl_user';
const String tblUserColId = 'user_id';
const String tblUserColName = 'name';
const String tblUserColGender = 'gender';
const String tblUserColAddress = 'address';
const String tblUserColBookPreference = 'book_preference';
const String tblUserColPhoneNumber = 'phone_number';
const String tblUserColEmail = 'email';
const String tblUserColPassword = 'password';
const String tblUserColConfirmPassword = 'confirm_password';

class UserModel {
  int? userId;
  String name;
  String gender;
  String address;
  String bookPreference;
  String phoneNumber;
  String email;
  String password;
  String confirmPassword;


  UserModel({
    this.userId,
    required this.name,
    required this.gender,
    required this.address,
    required this.bookPreference,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      tblUserColName: name,
      tblUserColGender: gender,
      tblUserColAddress: address,
      tblUserColBookPreference: bookPreference,
      tblUserColPhoneNumber: phoneNumber,
      tblUserColEmail: email,
      tblUserColPassword: password,
      tblUserColConfirmPassword: confirmPassword,
    };
    if(userId != null){
      map[tblUserColId] = userId;
    }
    return map;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) =>
      UserModel(
        userId: map[tblUserColId],
        name: map[tblUserColName],
        gender: map[tblUserColGender],
        address: map[tblUserColAddress],
        bookPreference: map[tblUserColBookPreference],
        phoneNumber: map[tblUserColPhoneNumber],
        email: map[tblUserColEmail],
        password: map[tblUserColPassword],
        confirmPassword: map[tblUserColConfirmPassword],
      );
}
