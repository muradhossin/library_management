import 'package:library_management/models/admin_model.dart';
import 'package:library_management/models/book_model.dart';
import 'package:library_management/models/booking_model.dart';
import 'package:library_management/models/user_model.dart';
import 'package:library_management/utils/helper_functions.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;

import '../models/book_rating.dart';

class DbHelper{
  static const String createTableUser = '''create table $tableUser(
  $tblUserColId integer primary key autoincrement,
  $tblUserColName text,
  $tblUserColGender text,
  $tblUserColAddress text,
  $tblUserColBookPreference text,
  $tblUserColPhoneNumber text,
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
  $tblBookColImage text
  )''';


  static const String createTableBooking = '''create table $tableBooking(
  $tblBookingColId integer primary key autoincrement,
  $tblBookingColName text,
  $tblBookingColPhoneNumber text,
  $tblBookingColHiringDate text,
  $tblBookingColReturnDate text
  )''';

  static const String createTableRating = '''create table $tableRating(
  $tblRatingColBookId integer,
  $tblRatingColUserId integer,
  $tblRatingColDate text,
  $tblRatingColUserReviews text,
  $tblColRating real)''';
  
  
  static Future<Database> open() async {
    final rootPath = await getDatabasesPath();
    final dbPath = Path.join(rootPath, 'library_db');
    return openDatabase(dbPath, version: 1, onCreate: (db, version) async {
     await db.execute(createTableUser);
     await db.execute(createTableAdmin);
     await db.execute(createTableBook);
     await db.execute(createTableBooking);
     await db.execute(createTableRating);
    });
  }

  static Future<int> insertUser(UserModel userModel) async{
    final db = await open();
    return db.insert(tableUser, userModel.toMap());
  }

  static Future<int> insertAdmin(AdminModel adminModel) async{
    final db = await open();
    return db.insert(tableAdmin, adminModel.toMap());
  }

  static Future<int> insertBook(BookModel bookModel) async{
    final db = await open();
    return db.insert(tableBook, bookModel.toMap());
  }

  static Future<int> insertBooking(BookingModel bookingModel) async{
    final db = await open();
    return db.insert(tableBooking, bookingModel.toMap());
  }

  static Future<int> insertRating(BookRating bookRating) async {
    final db = await open();
    return db.insert(tableRating, bookRating.toMap());
  }

  static Future<UserModel?> getUserByEmail(String email) async {
    final db = await open();
    final mapList = await db.query(tableUser, where: '$tblUserColEmail = ?', whereArgs: [email]);
    if(mapList.isEmpty) return null;
    return UserModel.fromMap(mapList.first);
  }

  static Future<UserModel> getUserById(int id) async {
    final db = await open();
    final mapList = await db.query(tableUser,
      where: '$tblUserColId = ?', whereArgs: [id],);
    return UserModel.fromMap(mapList.first);
  }

  static Future<AdminModel?> getAdminByEmail(String email) async {
    final db = await open();
    final mapList = await db.query(tableAdmin, where: '$tblAdminColEmail = ?', whereArgs: [email]);
    if(mapList.isEmpty) return null;
    return AdminModel.fromMap(mapList.first);
  }

  static Future<AdminModel> getAdminById(int id) async {
    final db = await open();
    final mapList = await db.query(tableAdmin,
      where: '$tblAdminColId = ?', whereArgs: [id],);
    return AdminModel.fromMap(mapList.first);
  }

  static Future<List<BookModel>> getAllBooks() async{
    final db = await open();
    final mapList = await db.query(tableBook);
    return List.generate(mapList.length, (index) => BookModel.fromMap(mapList[index]));
  }


  static Future<int> deleteBook(int id) async{
    final db = await open();
    return db.delete(tableBook, where: '$tblBookColId = ?', whereArgs: [id]);
  }

  static Future<int> updateBook(BookModel bookModel) async{
    final db = await open();
    return db.update(tableBook, bookModel.toMap(), where: '$tblBookColId = ?', whereArgs: [bookModel.bookId]);
  }

  static Future<BookModel> getBookById(int id) async{
    final db = await open();
    final mapList = await db.query(tableBook, where: '$tblBookColId = ?', whereArgs: [id]);
    return BookModel.fromMap(mapList.first);
  }

  static Future<List<BookRating>> getRatingsByBookId(int id) async {
    final db = await open();
    final mapList = await db.query(tableRating,
      where: '$tblRatingColBookId = ?', whereArgs: [id],);
    return List.generate(mapList.length, (index) =>
        BookRating.fromMap(mapList[index]));
  }



  static Future<int> updateRating(BookRating bookRating) async {
    final db = await open();
    return db.update(tableRating, bookRating.toMap(),
      where: '$tblRatingColBookId = ? and $tblRatingColUserId = ?', whereArgs: [bookRating.book_id, bookRating.user_id],);
  }



}