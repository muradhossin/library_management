import 'package:flutter/material.dart';
import 'package:library_management/models/book_comment.dart';

import '../db/db_helper.dart';

class CommentProvider extends ChangeNotifier{
  Future<int> insertRating(BookComment bookComment) {
    return DbHelper.insertComment(bookComment);
  }
  Future<List<BookComment>> getCommentsByUserId(int id) =>
      DbHelper.getCommentsByUserId(id);
}