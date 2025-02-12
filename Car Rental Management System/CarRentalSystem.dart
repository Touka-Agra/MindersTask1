import 'dart:io';

import 'Booking.dart';
import 'Car/Car.dart';
import 'Customer.dart';
import 'Invoice.dart';

class Carrentalsystem {
  Map<String, Car> cars = {};
  Map<String, Customer> customers = {};
  Map<String, Booking> bookings = {};

  void addCar(Car car) {
    if (cars.containsKey(car.carId)) {
      print("This Car Id already Exists");
      return;
    }
    cars[car.carId] = car;
  }

  void registerCustomer(Customer customer) {
    if (customers.containsKey(customer.customerId)) {
      print("This Customer Id already Exists");
      return;
    }
    customers[customer.customerId] = customer;
  }

  void createBooking(
      {required String bookingId,
      required Customer customer,
      required Car car,
      required DateTime startDate,
      required DateTime endDate}) {
    if (_bookingValidations(car: car, customerId: customer.customerId)) {
      if (bookings.containsKey(bookingId)) {
        print("This Booking Id already Exits\n");
        return;
      }
      if (startDate.isAfter(endDate)) {
        print("Invalid start and end time\n");
        return;
      }
      Booking book = Booking(
          bookingId: bookingId,
          customer: customer,
          car: car,
          startDate: startDate,
          endDate: endDate);
      customer.addBooking(book);
      bookings[bookingId] = book;
      car.availability = false;

      print(
          "Booking Completed Successfully, We want to inform you that if you return the car before the end date, the total Price will be calculated from start date to the end date (THIS IS OUR POLICY)");
      print("Have a nice Ride :)\n");
    }
  }

  void returnCar(
      {required String bookingId,
      required Duration rentalDuration,
      double usedDistance = 0}) {
    if (bookings.containsKey(bookingId)) {
      bookings[bookingId]!.car.availability = true;
      bookings[bookingId]!.setRentalDuration(rentalDuration);
      bookings[bookingId]!.calculateTotalCost(usedDistance);

      Invoice invoice = _createInvoice(bookingId);
      invoice.displayInvioce();
    } else {
      print("There is no Booking with this ID");
    }
  }

  Invoice _createInvoice(String bookingId) {
    Invoice invoice = Invoice(
        booking: bookings[bookingId]!,
        customer: bookings[bookingId]!.customer,
        car: bookings[bookingId]!.car,
        totalCost: bookings[bookingId]!.totalCost);

    return invoice;
  }

  void displayAvailableCars() {
    if (cars.isEmpty) {
      print("\nNo Available Cars\n");
      return;
    }
    print("\nAvailable Cars:");
    for (Car car in cars.values) {
      if (_checkCarAvailability(car)) {
        car.displayCarDetails();
      }
    }
    print('\n');
  }

  Future<void> generateReport() async {
    String path = "C:/Flutter";
    Directory dir = Directory(path);

    if (!await dir.exists()) {
      await dir.create(
          recursive: true); // recursive creates parent directories if necessary
      print('Directory created at: $path');
    }

    String filePath = path += "/Reports.csv";
    File file = File(filePath);

    List<String> headers = [
      "Customer Name",
      "Car ID",
      "Car Type",
      "Base Rental Cost",
      "Booking ID",
      "Start Date",
      "Rental Duration",
      "Additional Fees",
      "Late Return Penality",
      "Total Cost"
    ];
    String csvData = headers.join(',') + '\n';

    for (var booking in bookings.values) {
      Invoice invoice = _createInvoice(booking.bookingId);
      String data = invoice.getInvoiceDetails();

      csvData += data;
    }
    try {
      await file.writeAsString(csvData);
      print("Report Created Successfully at 'C:/Flutter/Reports.csv'");
    } catch (e) {
      print("Error while Generating Report!");
    }
  }

  bool _checkCarAvailability(Car car) => car.availability;

  bool _checkCarExistance(String carId) => cars.containsKey(carId);

  bool _checkCustomerRegistration(String customerId) =>
      customers.containsKey(customerId);

  bool _bookingValidations({required Car car, required String customerId}) {
    if (!_checkCarExistance(car.carId)) {
      print("This Car doesn't Exist!");
      return false;
    }
    if (!_checkCarAvailability(car)) {
      print("This Car is Unavailable!");
      return false;
    }
    if (!_checkCustomerRegistration(customerId)) {
      print("Customer is not Registered!");
      return false;
    }
    return true;
  }
}
