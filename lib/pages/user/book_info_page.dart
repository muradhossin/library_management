import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:library_management/custom_widgets/drawer_widget.dart';
import 'package:library_management/models/book_comment.dart';
import 'package:library_management/models/book_model.dart';
import 'package:library_management/models/book_rating.dart';
import 'package:library_management/models/user_model.dart';
import 'package:library_management/pages/user/booking_book_page.dart';
import 'package:library_management/providers/book_provider.dart';
import 'package:library_management/providers/comment_provider.dart';
import 'package:library_management/providers/rating_provider.dart';
import 'package:library_management/providers/user_provider.dart';
import 'package:library_management/utils/constants.dart';
import 'package:library_management/utils/helper_functions.dart';
import 'package:provider/provider.dart';

class BookInfoPage extends StatefulWidget {
  const BookInfoPage({Key? key}) : super(key: key);

  static const String routeName = '/bookinfopage';

  @override
  State<BookInfoPage> createState() => _BookInfoPageState();
}

class _BookInfoPageState extends State<BookInfoPage> {
  late BookProvider provider;
  late int id;
  late String name;
  late int userId;
  final txtController = TextEditingController();
  double rating = 0;
  late RatingProvider ratingProvider;
  int count = 0;
  late UserProvider userProvider;
  late String userName;
  late CommentProvider commentProvider;

  @override
  void didChangeDependencies() {
    final argList = ModalRoute.of(context)!.settings.arguments as List;
    provider = Provider.of<BookProvider>(context, listen: false);
    id = argList[0];
    name = argList[1];
    userId = argList[2];
    userName = argList[3];
    ratingProvider = Provider.of<RatingProvider>(context, listen: false);
    userProvider = Provider.of<UserProvider>(context, listen: false);
    commentProvider = Provider.of<CommentProvider>(context, listen: false);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DrawerWidget(
        id: userId,
      ),
      appBar: AppBar(
        title: Text(name),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save),
          ),
          const SizedBox(
            width: 15,
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, BookingBookPage.routeName);
            },
            icon: const Icon(Icons.shopping_cart),
          ),
          Builder(
            builder: (context) => GestureDetector(
              onTap: () => Scaffold.of(context).openEndDrawer(),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.person,
                  size: 35,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder<BookModel>(
            future: provider.getBookById(id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final book = snapshot.data;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 400,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Image.file(
                          File(book!.image),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(book.title),
                      subtitle: Text(
                          'Author: ${book.authorName} Category: ${book.category}'),
                      trailing: FutureBuilder<double>(
                        future: ratingProvider.getBookRating(id),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final rate = snapshot.data;
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.star_rate),
                                Text(rate!.toStringAsFixed(1)),
                              ],
                            );
                          }
                          if (snapshot.hasError) {
                            return const Text('Unable to load');
                          }
                          return CircularProgressIndicator();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        book.description,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Center(
                      child: Text(
                        'Give Your Rating',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RatingBar.builder(
                          initialRating: rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rat) {
                            rating = rat;
                          },
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {});
                            _saveRating();
                            count = count + 1;
                          },
                          icon: Icon(
                            Icons.send,
                            color: Colors.lightBlue,
                            size: 45,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Comments',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    FutureBuilder<List<BookComment>>(
                      future: commentProvider.getCommentsByUserId(id),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final comments = snapshot.data;
                          return Card(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                              color: Colors.grey,
                            )),
                            child: ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: comments?.length,
                              itemBuilder: (context, index) {
                                final comment = comments![index];
                                return ListTile(
                                  leading: Icon(
                                    Icons.person,
                                    size: 40,
                                  ),
                                  title: Text(comment.name ?? 'unknown'),
                                  subtitle: Text(comment.user_reviews),
                                );
                              },
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          return Text('Failed to load data');
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: txtController,
                        cursorColor: Colors.black,
                        maxLines: 10,
                        minLines: 8,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            hintText: "Type your comment here...",
                            contentPadding: const EdgeInsets.all(10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20.0, top: 8.0, bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {});
                              _saveComment();
                            },
                            child: Text('Submit'),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              if (snapshot.hasError) {
                return const Text('Failed to laod data');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    txtController.dispose();
    super.dispose();
  }

  _saveRating() async {
    final bookRating = BookRating(
      book_id: id,
      user_id: userId,
      rating_date: getFormattedDate(DateTime.now(), dateTimePattern),
      user_reviews: txtController.text,
      rating: rating,
      name: userName,
    );
    ratingProvider.insertRating(bookRating);

    if (count != 0) {
      ratingProvider.updateRating(bookRating).then((value) {
        setState(() {
          txtController.clear();
          rating = 0;
        });
        showMsg(context, 'Your rating has been updated');
      }).catchError((error) {
        print(error.toString());
      });
    } else {
      ratingProvider.insertRating(bookRating).then((value) {
        setState(() {
          txtController.clear();
          rating = 0;
        });
        showMsg(context, 'Your rating has been submitted');
      }).catchError((error) {
        print(error.toString());
      });
    }
  }

  void _saveComment() async {
    final bookComment = BookComment(
      book_id: id,
      user_id: userId,
      rating_date: getFormattedDate(DateTime.now(), dateTimePattern),
      user_reviews: txtController.text,
      name: userName,
    );
    commentProvider.insertRating(bookComment);
    setState(() {
      txtController.clear();
    });
  }
}
