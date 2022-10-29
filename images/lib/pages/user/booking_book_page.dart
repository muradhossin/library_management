import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:library_management/models/booking_model.dart';
import 'package:library_management/models/user_model.dart';
import 'package:library_management/pages/user/book_info_page.dart';
import 'package:library_management/pages/user/hired_book.dart';
import 'package:library_management/pages/user/user_home_page.dart';
import 'package:library_management/providers/booking_provider.dart';
import 'package:library_management/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/helper_functions.dart';

class BookingBookPage extends StatefulWidget {
  const BookingBookPage({Key? key}) : super(key: key);

  static const String routeName = '/bookingbookpage';

  @override
  State<BookingBookPage> createState() => _BookingBookPageState();
}

class _BookingBookPageState extends State<BookingBookPage> {
  late String bookName;
  late String userName;
  DateTime? hireDate;
  DateTime? returnDate;
  late int userID;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  late BookingProvider bookingProvider;
  late UserProvider userProvider;


  @override
  void didChangeDependencies() {
    final argList = ModalRoute
        .of(context)!
        .settings
        .arguments as List;
    bookName = argList[0];
    userName = argList[1];
    userID = argList[2];
    bookingProvider = Provider.of<BookingProvider>(context, listen: false);
    userProvider = Provider.of<UserProvider>(context, listen: false);
    if(userID != null) {
      _setData(userID);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Page"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: [Text(
                  'Hi $userName!',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline3,
                ),],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 8.0),
              child: Wrap(
                children: [Text(
                  'You are selecting $bookName book.',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline6,
                ),],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 8.0),
              child: Wrap(
                children: [Text(
                  'For HIRING this book, please fillup required fields.',
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium,
                ),],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: 'Your Name',
                  labelText: 'Your Name',
                ),
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
                controller: addressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: 'Address',
                  labelText: 'Address',
                ),
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
                controller: phoneNumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: 'Phone Number',
                  labelText: 'Phone Number',
                ),
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
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: selectHireDate,
                      icon: const Icon(Icons.calendar_month),
                      label: const Text('Select Hire Date'),
                    ),
                    Text(hireDate == null
                        ? 'No date chosen'
                        : getFormattedDate(hireDate!, 'dd/MM/yyyy'))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 8, right: 8, bottom: 8, top: 4),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: selectReturnDate,
                      icon: const Icon(Icons.calendar_month),
                      label: const Text('Select Return Date'),
                    ),
                    Text(returnDate == null
                        ? 'No date chosen'
                        : getFormattedDate(returnDate!, 'dd/MM/yyyy'))
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: DropdownButtonFormField(
            //     borderRadius: BorderRadius.circular(20.0),
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(20.0),
            //         ),
            //         hintText: "for how many days",
            //         labelText: 'for how many days'),
            //     items: <String>['1', '2', '3', '4', '5'].map((String value) {
            //       return DropdownMenuItem<String>(
            //         value: value,
            //         child: Text(value),
            //       );
            //     }).toList(),
            //     onChanged: (_) {},
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      saveBooking();
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                        title: const Text('Your booking is Confirmed'),
                        content:  Text('Please collect your book on this day $hireDate'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, HiredBook.routeName, arguments: userID);
                            },
                            child: const Text('Okay'),
                          ),
                        ],
                      ),);
                    },
                    child: const Text("Confirm"),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                        title: const Text('Order Cancel'),
                        content: const Text('Are you sure?'),
                        actions: [
                          TextButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: const Text('No'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).popUntil(ModalRoute.withName('/userhomepage'));
                            },
                            child: const Text("Yes"),
                          ),
                        ],
                      ),);

                    },
                    child: const Text("Cancel"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void selectHireDate() async {
    final selectedHireDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2023),
    );
    if (selectedHireDate != null) {
      setState(() {
        hireDate = selectedHireDate;
      });
    }
  }

  void selectReturnDate() async {
    final selectedReturnDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2023),
    );
    if (selectedReturnDate != null) {
      setState(() {
        returnDate = selectedReturnDate;
      });
    }
  }

  void saveBooking() {
    if (_formKey.currentState!.validate()) {
      final booking = BookingModel(
        name: nameController.text,
        address: addressController.text,
        phoneNumber: phoneNumberController.text,
        hiringDate: hireDate.toString(),
        returnDate: returnDate.toString(),
        bookName: bookName,
        userId: userID,
      );

      bookingProvider.insertBooking(booking);
  }

  }

  void _setData(int userID) async{
    final userInfo = await userProvider.getUserById(userID);
    nameController.text = userInfo.name;
    addressController.text = userInfo.address;
    phoneNumberController.text = userInfo.phoneNumber;

  }


}
