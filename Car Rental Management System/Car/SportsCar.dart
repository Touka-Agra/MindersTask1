import 'Car.dart';

class Sportscar extends Car {
  late double luxuryFees;
  Sportscar(
      {required String carId,
      required String year,
      required double pricePerDay,
      required bool availabilty,
      required double luxuryFees})
      : super(
            carId: carId,
            year: year,
            pricePerDay: pricePerDay,
            availabilty: availabilty) {
    this.luxuryFees = luxuryFees;
  }

  @override
  void displayCarDetails() {
    print(
        "CarID: $carId, Year: $year, Rental Price: $pricePerDay, Availability: $availability, Luxury Fees: $luxuryFees");
  }

  @override
  double calculateCost(int numberOfDays, {double usedDistance = 0}) {
    return super.calculateCost(numberOfDays) + luxuryFees;
  }

  @override
  double getAdditionalFees() => luxuryFees;

  @override
  String getCarType() => "Sports Car";
}
