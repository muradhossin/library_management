import 'package:flutter/material.dart';
import 'package:library_management/db/db_helper.dart';

import '../models/book_model.dart';

class BookProvider extends ChangeNotifier{
  List<BookModel> bookList = [];

  Future<int> insertBook(BookModel bookModel){
    return DbHelper.insertBook(bookModel);
  }

  void getAllBooks() async{
    bookList = await DbHelper.getAllBooks();
    notifyListeners();
  }

  Future<int> deleteBook(int id){
    return DbHelper.deleteBook(id);
  }

  Future<int> updateBook(BookModel bookModel){
    return DbHelper.updateBook(bookModel);
  }

  Future<BookModel> getBookById(int id){
    return DbHelper.getBookById(id);
  }
  BookModel getItem(int id){
    return bookList.firstWhere((element) => element.bookId == id);
  }
}