import 'package:flutter/material.dart';
import 'package:library_management/models/book_rating.dart';

import '../db/db_helper.dart';
import '../models/user_model.dart';

class RatingProvider extends ChangeNotifier{


  Future<int> insertRating(BookRating bookRating) {
    return DbHelper.insertRating(bookRating);
  }


  Future<int> updateRating(BookRating bookRating) =>
      DbHelper.updateRating(bookRating);

  Future<double> getBookRating(int bookId) async {
    final ratingList = await DbHelper.getRatingsByBookId(bookId);
    return _calculateRating(ratingList);
  }


  Future<List<BookRating>> getRateByUserId(int id) =>
      DbHelper.getRateByUserId(id);

  double _calculateRating(List<BookRating> ratingList) {
    double rating = 0.0;
    for(var rat in ratingList) {
      rating += rat.rating;
    }
    return rating / ratingList.length;
  }
}