import 'package:flutter/material.dart';
import 'package:library_management/models/booking_model.dart';

import '../db/db_helper.dart';

class BookingProvider extends ChangeNotifier{
  Future<int> insertBooking(BookingModel bookingModel) {
    return DbHelper.insertBooking(bookingModel);
  }
}