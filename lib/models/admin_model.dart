const String tableAdmin = 'tbl_admin';
const String tblAdminColId = 'admin_id';
const String tblAdminColName = 'name';
const String tblAdminColEmail = 'email';
const String tblAdminColPassword = 'password';
const String tblAdminColConfirmPassword = 'confirm_password';
const String tblAdminColReferral = 'referral';

class AdminModel {
  int? adminId;
  String name;
  String email;
  String password;
  String confirmPassword;
  String referral;

  AdminModel({
    this.adminId,
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.referral,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      tblAdminColName: name,
      tblAdminColEmail: email,
      tblAdminColPassword: password,
      tblAdminColConfirmPassword: confirmPassword,
      tblAdminColReferral: referral,
    };

    if (adminId != null) {
      map[tblAdminColId] = adminId;
    }
    return map;
  }

  factory AdminModel.fromMap(Map<String, dynamic>map) =>
      AdminModel(
        adminId: map[tblAdminColId],
        name: map[tblAdminColName],
        email: map[tblAdminColEmail],
        password: map[tblAdminColPassword],
        confirmPassword: map[tblAdminColConfirmPassword],
        referral: map[tblAdminColReferral],
      );

}
