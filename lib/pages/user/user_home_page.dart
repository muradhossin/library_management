import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:library_management/custom_widgets/drawer_widget.dart';
import 'package:library_management/models/user_model.dart';
import 'package:library_management/pages/user/book_info_page.dart';
import 'package:library_management/pages/user/user_login_page.dart';
import 'package:provider/provider.dart';

import '../../providers/book_provider.dart';
import '../../providers/user_provider.dart';
import '../../utils/constants.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  static const String routeName = '/userhomepage';

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  late BookProvider provider;
  String? selectedValue;
  late int id;

  @override
  void didChangeDependencies() async{
    Provider.of<BookProvider>(context, listen: false).getAllBooks();
    id = ModalRoute.of(context)!.settings.arguments as int;
    final providerUser = Provider.of<UserProvider>(context, listen: false);
    super.didChangeDependencies();

  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<BookProvider>(context);
    return Scaffold(
      endDrawer: DrawerWidget(id: id,),
      appBar: AppBar(
        title: Text('User Home Page'),
        actions: [
          Builder(
            builder: (context) => GestureDetector(
              onTap: () => Scaffold.of(context).openEndDrawer(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(Icons.person, size: 30,),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Recommended for you',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(height: 400.0),
              items: images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Image.asset(
                        i,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            ListTile(
              title: const Text('All Books'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      hint: Text(
                        'filter by',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: filter
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                      buttonHeight: 40,
                      buttonWidth: 140,
                      itemHeight: 40,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              primary: false,
              // scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: provider.bookList.length,
              itemBuilder: (context, index) {
                final book = provider.bookList[index];
                return Card(
                  elevation: 2,
                  shape: Border.all(color: Colors.blue.shade300, width: 1),
                  shadowColor: Colors.blueGrey,
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        BookInfoPage.routeName,
                        arguments: [book.bookId, book.title, id]
                      );
                    },
                    leading: Image.file(File(book.image)),
                    title: Text(book.title),
                    subtitle: Text(
                        'Author: ${book.authorName} Category: ${book.category}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star_rate),
                        Text('4.5'),
                      ],
                    ),
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}

final List<String> images = [
  'images/1.jpg',
  'images/2.jpg',
  'images/3.jpg',
];
