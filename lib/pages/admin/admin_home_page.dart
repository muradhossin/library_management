import 'package:flutter/material.dart';
import 'package:library_management/models/booking_model.dart';
import 'package:library_management/pages/admin/admin_book_list_page.dart';
import 'package:library_management/providers/booking_provider.dart';
import 'package:provider/provider.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);
  static const String routeName = '/adminhomepage';

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  late BookingProvider bookingProvider;

  @override
  void didChangeDependencies() {
    bookingProvider = Provider.of<BookingProvider>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Home Page'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AdminBookListPage.routeName);
            },
            child: Text(
              'Book Store',
              style: TextStyle(color: Colors.amber, fontSize: 25),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Card(
                elevation: 5,
                child: Text('Requested Book List',
                    style: Theme.of(context).textTheme.headline4),
              ),
            ),
            FutureBuilder<List<BookingModel>>(
              future: bookingProvider.getAllBooking(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final bookingList = snapshot.data;
                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: bookingList?.length,
                    itemBuilder: (context, index){
                      final booking = bookingList![index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blue)
                          ),
                          elevation: 5,
                          child: ListTile(
                            leading: Icon(Icons.bookmark_border),
                            title: Text(booking.name),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Phone Number: ${booking.phoneNumber}'),
                                Text('Book name: ${booking.bookName}'),
                                Text('Order date: ${booking.hiringDate}'),
                                Text('Return date: ${booking.returnDate}'),
                              ],
                            ),

                          ),
                        ),
                      );
                    },
                  );
                }

                if (snapshot.hasError) {
                  return Text('failed to load data');
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
