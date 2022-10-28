const String tableBooking = 'tbl_booking';
const String tblBookingColId = 'booking_id';
const String tblBookingColName = 'name';
const String tblBookingColAddress = 'address';
const String tblBookingColPhoneNumber = 'phone_number';
const String tblBookingColHiringDate = 'hiring_date';
const String tblBookingColReturnDate = 'return_date';
const String tblBookingColBookName= 'bookName';

class BookingModel {
  int? bookingId;
  String name;
  String address;
  String phoneNumber;
  String hiringDate;
  String returnDate;
  String bookName;

  BookingModel({
    this.bookingId,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.hiringDate,
    required this.returnDate,
    required this.bookName,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      tblBookingColName: name,
      tblBookingColAddress: address,
      tblBookingColPhoneNumber: phoneNumber,
      tblBookingColHiringDate: hiringDate,
      tblBookingColReturnDate: returnDate,
      tblBookingColBookName: bookName,
    };

    if (bookingId != null) {
      map[tblBookingColId] = bookingId;
    }
    return map;
  }

  factory BookingModel.fromMap(Map<String, dynamic> map) => BookingModel(
        bookingId: map[tblBookingColId],
        name: map[tblBookingColName],
        address: map[tblBookingColAddress],
        phoneNumber: map[tblBookingColPhoneNumber],
        hiringDate: map[tblBookingColHiringDate],
        returnDate: map[tblBookingColReturnDate],
        bookName: map[tblBookingColBookName],
      );
}
