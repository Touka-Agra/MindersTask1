import 'Booking.dart';
import 'Car/Car.dart';
import 'Customer.dart';

class Invoice {
  late final Booking booking;
  late Customer customer;
  late Car car;
  late double totalCost;

  Invoice(
      {required Booking booking,
      required Customer customer,
      required Car car,
      required double totalCost}) {
    this.booking = booking;
    this.customer = customer;
    this.car = car;
    this.totalCost = totalCost;
  }

  void displayInvioce() {
    String bookingDetails = _getBookingDetailsForInvoice(true);

    print(
        "Customer Name: ${customer.name}, Car ID: ${car.carId}, Car Type: ${car.getCarType()}, Base Rental Cost: ${car.pricePerDay}, $bookingDetails\n");
  }

  String getInvoiceDetails() {
    String bookingDetails = _getBookingDetailsForInvoice(false);
    return "${customer.name}, ${car.carId}, ${car.getCarType()}, ${car.pricePerDay}, $bookingDetails\n";
  }

  String _getBookingDetailsForInvoice(bool type) {
    if (type) {
      return "BookingID: ${booking.bookingId}, Start Date: ${booking.startDate}, Rental Duration: ${booking.rentalDuration.inDays}, Additional Fees: ${booking.additionalFees}, Late Return Penality: ${booking.lateReturnPenality}, Total Cost: ${totalCost}";
    } else {
      return "${booking.bookingId}, ${booking.startDate}, ${booking.rentalDuration.inDays}, ${booking.additionalFees}, ${booking.lateReturnPenality}, ${totalCost}";
    }
  }
}
