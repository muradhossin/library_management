import 'package:flutter/material.dart';
import 'package:library_management/models/book_model.dart';
import 'package:library_management/pages/admin/admin_book_list_page.dart';
import 'package:library_management/utils/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import '../../providers/book_provider.dart';
import '../../utils/helper_functions.dart';

class NewBookAdd extends StatefulWidget {
  const NewBookAdd({Key? key}) : super(key: key);

  static const String routeName = '/newbookadd';

  @override
  State<NewBookAdd> createState() => _NewBookAddState();
}

class _NewBookAddState extends State<NewBookAdd> {
  late BookProvider bookProvider;
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final authorNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final budgetController = TextEditingController();
  String? selectedType;
  String? imagePath;
  int? id;

  @override
  void didChangeDependencies() {
    id = ModalRoute.of(context)!.settings.arguments as int?;
    bookProvider = Provider.of<BookProvider>(context, listen: false);
    if(id != null){
      final book = bookProvider.getItem(id!);
      _setData(book);
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(id == null ? 'Add New Book' : 'Update Book'),
        actions: [
          IconButton(
            onPressed: saveBook,
            icon: Icon(id == null ? Icons.save : Icons.update),
          )
        ],
      ),
      body: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                      hintText: 'Enter Book Title',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: authorNameController,
                  decoration: InputDecoration(
                      hintText: 'Enter Author Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1))),
                    hint: Text('Select Book Category'),
                    items: bookCategoryList
                        .map((e) => DropdownMenuItem(value: e, child: Text(e!)))
                        .toList(),
                    value: selectedType,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a Category';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        selectedType = value;
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      hintText: 'Enter Description',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    imagePath == null
                        ? const Icon(
                            Icons.movie,
                            size: 100,
                          )
                        : Image.file(
                            File(imagePath!),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                    TextButton.icon(
                      onPressed: getImage,
                      icon: const Icon(Icons.photo),
                      label: const Text('Select from Gallery'),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }

  void getImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        imagePath = file.path;
      });
    }
  }

  void saveBook() {
    if (imagePath == null) {
      showMsg(context, 'Please select an image');
      return;
    }

    if (_formKey.currentState!.validate()) {
      final book = BookModel(
        title: titleController.text,
        authorName: authorNameController.text,
        category: selectedType!,
        description: descriptionController.text,
        image: imagePath!,
      );
      if(id != null){
        book.bookId = id;
        bookProvider.updateBook(book).then((value) {
          bookProvider.getAllBooks();
          Navigator.pop(context);
        }).catchError((onError){
          print(onError.toString());
        });
      }else{
        bookProvider.insertBook(book).then((value) {
          bookProvider.getAllBooks();
          Navigator.pop(context);
        }).catchError((onError){
          print(onError.toString());
        });
      }
    }
  }

  void _setData(BookModel book) {
    titleController.text = book.title;
    authorNameController.text = book.authorName;
    selectedType = book.category;
    descriptionController.text = book.description;
    imagePath = book.image;
  }
}
