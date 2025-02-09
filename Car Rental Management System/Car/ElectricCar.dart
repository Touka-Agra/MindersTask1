import 'Car.dart';

class Electriccar extends Car {
  late double chargingPrice;
  Electriccar(
      {required String carId,
      required String year,
      required double pricePerDay,
      required bool availabilty,
      required double chargingPrice})
      : super(
            carId: carId,
            year: year,
            pricePerDay: pricePerDay,
            availabilty: availabilty) {
    this.chargingPrice = chargingPrice;
  }

  @override
  void displayCarDetails() {
    print(
        "CarID: $carId, Year: $year, Rental Price: $pricePerDay, Availability: $availability, Charging Price: $chargingPrice");
  }

  @override
  double calculateCost(int numberOfDays, {double usedDistance = 0}) {
    double chargingFees = usedDistance * chargingPrice;
    return super.calculateCost(numberOfDays, usedDistance: usedDistance) +
        chargingFees;
  }

  @override
  double getAdditionalFees() => chargingPrice;

  @override
  String getCarType() => "Electric Car";
}
