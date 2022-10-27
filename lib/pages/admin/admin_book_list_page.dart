import 'dart:io';

import 'package:flutter/material.dart';
import 'package:library_management/models/book_model.dart';
import 'package:library_management/pages/admin/admin_book_info_page.dart';
import 'package:library_management/pages/admin/new_book_add.dart';
import 'package:library_management/providers/book_provider.dart';
import 'package:library_management/utils/helper_functions.dart';
import 'package:provider/provider.dart';

class AdminBookListPage extends StatefulWidget {
  const AdminBookListPage({Key? key}) : super(key: key);

  static const String routeName = '/adminbooklistpage';

  @override
  State<AdminBookListPage> createState() => _AdminBookListPageState();
}

class _AdminBookListPageState extends State<AdminBookListPage> {
  late BookProvider provider;
  @override
  void didChangeDependencies() {
    Provider.of<BookProvider>(context, listen: false).getAllBooks();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<BookProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Book List'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, NewBookAdd.routeName);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: provider.bookList.length,
        itemBuilder: (context, index) {
          final book = provider.bookList[index];
          return BookItem(book: book, provider: provider,);
        },
      ),
    );
  }
}

class BookItem extends StatelessWidget {
  const BookItem({
    Key? key,
    required this.book,
    required this.provider,
  }) : super(key: key);
  final BookModel book;
  final BookProvider provider;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: Border.all(color: Colors.blue.shade300, width: 1),
      shadowColor: Colors.blueGrey,
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            AdminBookInfoPage.routeName,
            arguments: [book.bookId, book.title]
          );
        },
        leading: Image.file(File(book.image)),
        title: Text(book.title),
        subtitle:
            Text('Author: ${book.authorName}  Category: ${book.category}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star_rate),
            const Text('4.5'),
            IconButton(
              onPressed: () {
                deleteBook(context, book.bookId!, provider);
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
