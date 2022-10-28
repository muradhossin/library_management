import 'package:library_management/models/user_model.dart';

const String tableRating = 'tbl_rating';
const String tblRatingColBookId = 'book_id';
const String tblRatingColUserId = 'user_id';
const String tblRatingColDate = 'rating_date';
const String tblRatingColUserReviews = 'user_reviews';
const String tblColRating = 'rating';
const String tblRatingColUserName = 'name';


class BookRating {
  String? name;
  int book_id;
  int user_id;
  String rating_date;
  String user_reviews;
  double rating;

  BookRating({
    this.name,
    required this.book_id,
    required this.user_id,
    required this.rating_date,
    required this.user_reviews,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      tblRatingColBookId: book_id,
      tblRatingColUserId: user_id,
      tblRatingColUserName: name,
      tblRatingColDate: rating_date,
      tblRatingColUserReviews: user_reviews,
      tblColRating: rating,
    };
  }

  factory BookRating.fromMap(Map<String, dynamic> map) => BookRating(
        book_id: map[tblRatingColUserId],
        user_id: map[tblRatingColUserId],
        rating_date: map[tblRatingColDate],
        user_reviews: map[tblRatingColUserReviews],
        rating: map[tblColRating],
        name: map[tblRatingColUserName],
      );
}
