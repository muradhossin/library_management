const String tableBook = 'tbl_book';
const String tblBookColId = 'bookId';
const String tblBookColTitle = 'title';
const String tblBookColAuthorName = 'author_name';
const String tblBookColCategory = 'category';
const String tblBookColDescription = 'description';
const String tblBookColImage = 'image';

class BookModel {
  int? bookId;
  String title;
  String authorName;
  String category;
  String description;
  String image;

  BookModel({
    this.bookId,
    required this.title,
    required this.authorName,
    required this.category,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      tblBookColTitle: title,
      tblBookColAuthorName: authorName,
      tblBookColCategory: category,
      tblBookColDescription: description,
      tblBookColImage: image,

    };
    if (bookId != null) {
      map[tblBookColId] = bookId;
    }
    return map;
  }

  factory BookModel.fromMap(Map<String, dynamic> map) => BookModel(
    bookId: map[tblBookColId],
    title: map[tblBookColTitle],
    authorName: map[tblBookColAuthorName],
    category: map[tblBookColCategory],
    description: map[tblBookColDescription],
    image: map[tblBookColImage],
  );
}
