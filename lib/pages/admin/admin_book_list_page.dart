import 'package:flutter/material.dart';

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
            onPressed: () {},
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
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
                leading: Image.asset('images/2.jpg'),
                title: const Text('Himu Rimande'),
                subtitle: const Text('Author: Humayan Ahmed Category: Fiction'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rate),
                    const Text('4.0'),
                    IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
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
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
                leading: Image.asset('images/2.jpg'),
                title: const Text('Himu Rimande'),
                subtitle: const Text('Author: Humayan Ahmed Category: Fiction'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rate),
                    const Text('4.0'),
                    IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
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
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
                leading: Image.asset('images/2.jpg'),
                title: const Text('Himu Rimande'),
                subtitle: const Text('Author: Humayan Ahmed Category: Fiction'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rate),
                    const Text('4.0'),
                    IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
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
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
                leading: Image.asset('images/2.jpg'),
                title: const Text('Himu Rimande'),
                subtitle: const Text('Author: Humayan Ahmed Category: Fiction'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rate),
                    const Text('4.0'),
                    IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
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
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
                leading: Image.asset('images/2.jpg'),
                title: const Text('Himu Rimande'),
                subtitle: const Text('Author: Humayan Ahmed Category: Fiction'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rate),
                    const Text('4.0'),
                    IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
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
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
                leading: Image.asset('images/2.jpg'),
                title: const Text('Himu Rimande'),
                subtitle: const Text('Author: Humayan Ahmed Category: Fiction'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rate),
                    const Text('4.0'),
                    IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
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
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
                leading: Image.asset('images/2.jpg'),
                title: const Text('Himu Rimande'),
                subtitle: const Text('Author: Humayan Ahmed Category: Fiction'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rate),
                    const Text('4.0'),
                    IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
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
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
                leading: Image.asset('images/2.jpg'),
                title: const Text('Himu Rimande'),
                subtitle: const Text('Author: Humayan Ahmed Category: Fiction'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rate),
                    const Text('4.0'),
                    IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
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
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
                leading: Image.asset('images/2.jpg'),
                title: const Text('Himu Rimande'),
                subtitle: const Text('Author: Humayan Ahmed Category: Fiction'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rate),
                    const Text('4.0'),
                    IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
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
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
                leading: Image.asset('images/2.jpg'),
                title: const Text('Himu Rimande'),
                subtitle: const Text('Author: Humayan Ahmed Category: Fiction'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rate),
                    const Text('4.0'),
                    IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
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
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
                leading: Image.asset('images/2.jpg'),
                title: const Text('Himu Rimande'),
                subtitle: const Text('Author: Humayan Ahmed Category: Fiction'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rate),
                    const Text('4.0'),
                    IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
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
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
                leading: Image.asset('images/2.jpg'),
                title: const Text('Himu Rimande'),
                subtitle: const Text('Author: Humayan Ahmed Category: Fiction'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rate),
                    const Text('4.0'),
                    IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
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
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
                leading: Image.asset('images/2.jpg'),
                title: const Text('Himu Rimande'),
                subtitle: const Text('Author: Humayan Ahmed Category: Fiction'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rate),
                    const Text('4.0'),
                    IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
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
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
                leading: Image.asset('images/2.jpg'),
                title: const Text('Himu Rimande'),
                subtitle: const Text('Author: Humayan Ahmed Category: Fiction'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rate),
                    const Text('4.0'),
                    IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
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
            Card(
              elevation: 2,
              shape: Border.all(color: Colors.blue.shade300, width: 1),
              shadowColor: Colors.blueGrey,
              child: ListTile(
                leading: Image.asset('images/2.jpg'),
                title: const Text('Himu Rimande'),
                subtitle: const Text('Author: Humayan Ahmed Category: Fiction'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rate),
                    const Text('4.0'),
                    IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.delete),
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
