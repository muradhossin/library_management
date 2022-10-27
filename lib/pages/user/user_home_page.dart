import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:library_management/pages/user/book_info_page.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  static const String routeName = '/userhomepage';

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Drawer(
        elevation: 16,
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.person),
              title: Text(
              'Name',
    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.save),
              title: Text(
              'Saved Book',
    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.history_rounded),
              title: Text(
              'Hired Book',
    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.logout),
              title: Text(
              'Log Out',
    ),
              ),
            ),
          ],
        ),
        ),
      appBar: AppBar(
        title: Text('User Home Page'),
        actions: [
          Builder(
            builder: (context) => GestureDetector(
              onTap: () => Scaffold.of(context).openEndDrawer(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('images/1.jpg'),
                ),
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
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
                onTap: (){
                  Navigator.pushNamed(context, BookInfoPage.routeName);
                },
                leading:  Image.asset('images/1.jpg'),
                title:const Text('Pother Pachali', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                subtitle:
                    const Text('Author: Bivutibushon Bondhopaddhoy\nCategory: Fiction',
                      style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children:const  [
                     Icon(Icons.star_rate),
                    Text('4.5'),
                  ],
                ),
                ),
            ),
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
                leading:  Image.asset('images/2.jpg'),
                title: Text('Himu Rimande',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                subtitle:
                    Text('Author: Humayan Ahmed\nCategory: Fiction',style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star_rate),
                    Text('4.0'),
                  ],
                ),
                ),
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

final List<String> filter = [
  'Author',
  'Published Year',
  'Fiction',
  'Nonfiction',
  'Drama',
  'Poetry',
  'Folktale',
];
