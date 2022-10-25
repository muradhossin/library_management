import 'package:library_management/models/admin_model.dart';
import 'package:library_management/models/book_model.dart';
import 'package:library_management/models/booking_model.dart';
import 'package:library_management/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;

class DbHelper{
  static const String createTableUser = '''create table $tableUser(
  $tblUserColId integer primary key autoincrement,
  $tblUserColName text,
  $tblUserColGender text,
  $tblUserColAddress text,
  $tblUserColBookPreference text,
  $tblUserColEmail text,
  $tblUserColPassword text,
  $tblUserColConfirmPassword text
  )''';

  static const String createTableAdmin = '''create table $tableAdmin(
  $tblAdminColId integer primary key autoincrement,
  $tblUserColName text,
  $tblAdminColEmail text,
  $tblAdminColPassword text,
  $tblAdminColConfirmPassword text,
  $tblAdminColReferral text
  )''';


  static const String createTableBook = '''create table $tableBook(
  $tblBookColId integer primary key autoincrement,
  $tblBookColTitle text,
  $tblBookColAuthorName text,
  $tblBookColCategory text,
  $tblBookColDescription text,
  $tblBookColRating text,
  $tblBookColImage text
  )''';


  static const String createTableBooking = '''create table $tableBooking(
  $tblBookingColId integer primary key autoincrement,
  $tblBookingColName text,
  $tblBookingColPhoneNumber text,
  $tblBookingColHiringDate text,
  $tblBookingColReturnDate text
  )''';
  
  
  static Future<Database> open() async {
    final rootPath = await getDatabasesPath();
    final dbPath = Path.join(rootPath, 'library_db');
    return openDatabase(dbPath, version: 1, onCreate: (db, version) async {
     await db.execute(createTableUser);
     await db.execute(createTableAdmin);
     await db.execute(createTableBook);
     await db.execute(createTableBooking);
    });
  }

  static Future<int> insertUser(UserModel userModel) async{
    final db = await open();
    return db.insert(tableUser, userModel.toMap());
  }

  static Future<int> insertAdmin(AdminModel adminModel) async{
    final db = await open();
    return db.insert(createTableAdmin, adminModel.toMap());
  }

  static Future<int> insertBook(BookModel bookModel) async{
    final db = await open();
    return db.insert(createTableAdmin, bookModel.toMap());
  }

  static Future<int> insertBooking(BookingModel bookingModel) async{
    final db = await open();
    return db.insert(createTableAdmin, bookingModel.toMap());
  }


}