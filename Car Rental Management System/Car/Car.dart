class Car {
  late final String carId;
  late final String year;
  late double pricePerDay;
  late bool availability;
  late double latePenalityPerDay;

  Car(
      {required String carId,
      required String year,
      required double pricePerDay,
      required bool availabilty,
      required double latePenalityPerDay}) {
    this.carId = carId;
    this.year = year;
    this.pricePerDay = pricePerDay;
    this.availability = availabilty;
    this.latePenalityPerDay = latePenalityPerDay;
  }

  void displayCarDetails() {
    print(
        "CarID: $carId, Year: $year, Rental Price: $pricePerDay, Availability:$availability");
  }

  double calculateCost(int numberOfDays, {double usedDistance = 0}) {
    return pricePerDay * numberOfDays;
  }

  double calculateLatePenalityCost(int numberOfExtraDays) {
    return latePenalityPerDay * numberOfExtraDays;
  }

  void setAvailability(bool newAvailabilty) {
    availability = newAvailabilty;
  }

  String getCarType() => "Car";

  double getAdditionalFees() => 0;
}
