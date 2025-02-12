import 'Car/Car.dart';
import 'Customer.dart';

class Booking {
  late final String bookingId;
  late final Customer customer;
  late final Car car;
  late final DateTime startDate;
  late final DateTime endDate;
  late final Duration rentalDuration;
  double totalCost = 0;
  double lateReturnPenality = 0;
  double additionalFees = 0;

  Booking(
      {required String bookingId,
      required Customer customer,
      required Car car,
      required DateTime startDate,
      required DateTime endDate}) {
    this.bookingId = bookingId;
    this.customer = customer;
    this.car = car;
    this.startDate = startDate;
    this.endDate = endDate;
    this.additionalFees = car.getAdditionalFees();
  }

  void displayBookingDetails() {
    print(
        "BookingID: $bookingId, Customer: $customer, Car: $car, Start Date: $startDate, End Date: $endDate, Rental Duration: $rentalDuration, Total Cost: $totalCost, Late Return Penality: $lateReturnPenality");
  }

  void calculateTotalCost(double usedDistance) {
    calculateLateReturn();
    int numberOfDays = endDate.difference(startDate).inDays;
    totalCost =
        car.calculateCost(numberOfDays, usedDistance: usedDistance) + lateReturnPenality;
    if (car.getCarType() == "Electric Car") {
      additionalFees = car.getAdditionalFees() * usedDistance;
    }
  }

  void calculateLateReturn() {
    int numberOfDays = endDate.difference(startDate).inDays;
    int rentalDurationDays = rentalDuration.inDays;
    if (rentalDurationDays > numberOfDays) {
      int numberOfExtraDays = rentalDurationDays - numberOfDays;
      lateReturnPenality = car.calculateLatePenalityCost(numberOfExtraDays);
    }
  }

  void setRentalDuration(Duration duration) => rentalDuration = duration;
}
