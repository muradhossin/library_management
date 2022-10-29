import 'package:library_management/models/user_model.dart';

const String tableComment = 'tbl_comment';
const String tblCommentColBookId = 'book_id';
const String tblCommentColUserId = 'user_id';
const String tblCommentColDate = 'rating_date';
const String tblCommentColUserReviews = 'user_reviews';
const String tblCommentColUserName = 'name';


class BookComment {
  String? name;
  int book_id;
  int user_id;
  String rating_date;
  String user_reviews;

  BookComment({
    this.name,
    required this.book_id,
    required this.user_id,
    required this.rating_date,
    required this.user_reviews,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      tblCommentColBookId: book_id,
      tblCommentColUserId: user_id,
      tblCommentColUserName: name,
      tblCommentColDate: rating_date,
      tblCommentColUserReviews: user_reviews,
    };
  }

  factory BookComment.fromMap(Map<String, dynamic> map) => BookComment(
    book_id: map[tblCommentColBookId],
    user_id: map[tblCommentColUserId],
    rating_date: map[tblCommentColDate],
    user_reviews: map[tblCommentColUserReviews],
    name: map[tblCommentColUserName],
  );
}
