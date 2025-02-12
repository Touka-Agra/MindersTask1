import 'Car.dart';

class Economycar extends Car {
  Economycar(
      {required String carId,
      required String year,
      required double pricePerDay,
      required bool availabilty,
      required double latePenalityPerDay})
      : super(
            carId: carId,
            year: year,
            pricePerDay: pricePerDay,
            availabilty: availabilty,
            latePenalityPerDay:latePenalityPerDay) {}

  @override
  String getCarType() => "Economy Car";
}
