import 'package:flutter/material.dart';
import 'package:library_management/pages/admin/admin_book_info_page.dart';
import 'package:library_management/pages/admin/new_book_add.dart';

class AdminBookListPage extends StatelessWidget {
  const AdminBookListPage({Key? key}) : super(key: key);

  static const String routeName = '/adminbooklistpage';

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
                onTap: (){
                  Navigator.pushNamed(context, AdminBookInfoPage.routeName);
                },
                leading: Image.asset('images/1.jpg'),
                title: const Text('Pother Pachali'),
                subtitle: const Text(
                    'Author: Bivutibushon Bondhopaddhoy Category: Fiction'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rate),
                    const Text('4.5'),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                    ),
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
