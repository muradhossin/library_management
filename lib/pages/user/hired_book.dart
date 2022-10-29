import 'package:flutter/material.dart';
import 'package:library_management/models/booking_model.dart';
import 'package:library_management/pages/admin/admin_book_list_page.dart';
import 'package:library_management/pages/user/user_home_page.dart';
import 'package:library_management/providers/booking_provider.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';

class HiredBook extends StatefulWidget {
  const HiredBook({Key? key}) : super(key: key);
  static const String routeName = '/hiredbook';

  @override
  State<HiredBook> createState() => _HiredBookState();
}

class _HiredBookState extends State<HiredBook> {
  late BookingProvider bookingProvider;
  late int userid;
  late BookingModel bookingModel;
  var penaltyAmount = 0;
  @override
  void didChangeDependencies() async {
    bookingProvider = Provider.of<BookingProvider>(context, listen: false);
    userid = ModalRoute.of(context)!.settings.arguments as int;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hired Book Info'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: (){
                Navigator.of(context).popUntil(ModalRoute.withName('/userhomepage'));
                // Navigator.pop(context);

              },
              icon: Icon(Icons.home, size:40,),
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
                child: Text('Hired Book List',
                    style: Theme.of(context).textTheme.headline4),
              ),
            ),
            FutureBuilder<List<BookingModel>>(
              future: bookingProvider.getBookingBookByUserId(userid),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final bookingBook = snapshot.data;
                  return ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: bookingBook?.length,
                    itemBuilder: (context, index){
                      final book = bookingBook![index];
                      var now = DateTime.now();
                      var returnDate = DateTime.parse(book.returnDate);
                      var daysRemaining = returnDate.difference(now);
                      if((daysRemaining.inDays) < 0){
                        penaltyAmount = (daysRemaining.inDays) * (-50);
                      }else{
                        penaltyAmount = 0;
                      }

                      return  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue)),
                          elevation: 5,
                          child: ListTile(
                            leading: Icon(Icons.bookmark_border),
                            title: Text("Book name: ${book!.bookName}"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Booking ID: ${book.bookingId}'),
                                Text('Hire date: ${book.hiringDate}'),
                                Text('Return date: ${book.returnDate}'),
                                Text('Days remaining: ${daysRemaining.inDays} day'),
                                Text('Amount of penalty: $penaltyAmount TK'),
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
