import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:library_management/pages/admin/admin_book_list_page.dart';
import 'package:library_management/pages/admin/new_book_add.dart';
import 'package:library_management/providers/book_provider.dart';
import 'package:library_management/utils/helper_functions.dart';
import 'package:provider/provider.dart';

import '../../models/book_model.dart';

class AdminBookInfoPage extends StatefulWidget {
  const AdminBookInfoPage({Key? key}) : super(key: key);

  static const String routeName = '/adminbookinfopage';

  @override
  State<AdminBookInfoPage> createState() => _AdminBookInfoPageState();
}

class _AdminBookInfoPageState extends State<AdminBookInfoPage> {
  late int id;
  late String name;
  late BookProvider provider;

  @override
  void didChangeDependencies() {
    final argList = ModalRoute.of(context)!.settings.arguments as List;
    provider = Provider.of<BookProvider>(context, listen: false);
    id = argList[0];
    name = argList[1];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, NewBookAdd.routeName, arguments: id)
                  .then((value) {
                setState(() {
                  name = value as String;
                });
              });
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              deleteBook(context, id, provider);
            },
            icon: const Icon(Icons.delete_forever),
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
                      padding: EdgeInsets.all(8.0),
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
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.star_rate),
                          Text('4.5'),
                        ],
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
                    Center(
                      child: RatingBar.builder(
                        initialRating: 3,
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
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Comments',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    const Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                        color: Colors.grey,
                      )),
                      child: ListTile(
                        leading: Icon(
                          Icons.person,
                          size: 40,
                        ),
                        title: Text("Md. Murad Hossin"),
                        subtitle: Text('This is really nice book.'),
                      ),
                    ),
                    const Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                        color: Colors.grey,
                      )),
                      child: ListTile(
                        leading: Icon(
                          Icons.person,
                          size: 40,
                        ),
                        title: Text("Md. Shamim"),
                        subtitle: Text('Awesome.'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
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
                            onPressed: () {},
                            child: Text('Submit'),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              if (snapshot.hasError) {
                return const Text('Failed to load data');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  // void _deleteBook(BuildContext context, int id, BookProvider provider) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text('Delete this book'),
  //       content: const Text('Are you sure to delete this book?'),
  //       actions: [
  //         TextButton(
  //           onPressed: (){
  //             Navigator.pop(context);
  //           },
  //           child: const Text('No'),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //             provider.deleteBook(id).then((value) {
  //               Navigator.pop(context);
  //               provider.getAllBooks();
  //             });
  //           },
  //           child: const Text("Yes"),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
