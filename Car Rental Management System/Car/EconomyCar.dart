import 'Car.dart';

class Economycar extends Car {
  Economycar(
      {required String carId,
      required String year,
      required double pricePerDay,
      required bool availabilty})
      : super(
            carId: carId,
            year: year,
            pricePerDay: pricePerDay,
            availabilty: availabilty) {}

  @override
  String getCarType() => "Economy Car";
}
