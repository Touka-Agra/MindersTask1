import 'Booking.dart';

class Customer {
  late final String customerId;
  late String name;
  late String phoneNumber;
  late String email;
  late String address;
  List<Booking> bookingHistory = [];

  Customer(
      {required String customerId,
      required String name,
      required String phoneNumber,
      required String email,
      required String address}) {
    this.customerId = customerId;
    this.name = name;
    this.phoneNumber = phoneNumber;
    this.email = email;
    this.address = address;
  }

  void displayCustomerInfo() {
    print(
        "CustomerID: $customerId, Name: $name, Phone Number: $phoneNumber, Email: $email, Address: $address, Booking History: $bookingHistory");
  }

  void addBooking(Booking book) {
    bookingHistory.add(book);
  }

  void displayBookingHistory() {
    print("Booking History:");
    if (bookingHistory.isEmpty) {
      print("No Booking History");
    }
    for (Booking booking in bookingHistory) {
      booking.displayBookingDetails();
    }
  }

  void setName(String newName) => name = newName;
  void setPhoneNumber(String newPhoneNumber) => phoneNumber = newPhoneNumber;
  void setEmail(String newEmail) => email = newEmail;
  void setAddress(String newAddress) => address = newAddress;
}
