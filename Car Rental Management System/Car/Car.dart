class Car {
  late final String carId;
  late final String year;
  late double pricePerDay;
  late bool availability;

  Car(
      {required String carId,
      required String year,
      required double pricePerDay,
      required bool availabilty}) {
    this.carId = carId;
    this.year = year;
    this.pricePerDay = pricePerDay;
    this.availability = availabilty;
  }

  void displayCarDetails() {
    print(
        "CarID: $carId, Year: $year, Rental Price: $pricePerDay, Availability:$availability");
  }

  double calculateCost(int numberOfDays, {double usedDistance = 0}) {
    return pricePerDay * numberOfDays;
  }

  void setAvailability(bool newAvailabilty) {
    availability = newAvailabilty;
  }

  String getCarType() => "Car";

  double getAdditionalFees() => 0;
}
