import 'Car/Car.dart';
import 'Car/EconomyCar.dart';
import 'Car/ElectricCar.dart';
import 'Car/SportsCar.dart';
import 'CarRentalSystem.dart';
import 'Customer.dart';

void main() {
  Carrentalsystem carRentalSystem = Carrentalsystem();

//Customers
  Customer customer1 = Customer(
      customerId: "1",
      name: "Touka",
      phoneNumber: "1111",
      email: "1111@gmail.com",
      address: "1 Street");

  Customer customer2 = Customer(
      customerId: "2",
      name: "Menna",
      phoneNumber: "2222",
      email: "2222@gmail.com",
      address: "2 Street");

  Customer customer3 = Customer(
      customerId: "3",
      name: "Osama",
      phoneNumber: "3333",
      email: "3333@gmail.com",
      address: "3 Street");

//Cars
  Car car1 = Economycar(
      carId: "1", year: "2011", pricePerDay: 1000, availabilty: true, latePenalityPerDay:1100);

  Car car2 = Electriccar(
      carId: "2",
      year: "2018",
      pricePerDay: 2000,
      availabilty: true,
      chargingPrice: 20,
      latePenalityPerDay:2200);

  Car car3 = Sportscar(
      carId: "3",
      year: "2025",
      pricePerDay: 3000,
      availabilty: true,
      luxuryFees: 1000,
      latePenalityPerDay:3300);

//Register Customers
  carRentalSystem.registerCustomer(customer1);
  carRentalSystem.registerCustomer(customer2);

//Add Cars
  carRentalSystem.addCar(car1);
  carRentalSystem.addCar(car2);

  carRentalSystem.displayAvailableCars();

//Book Car1
  carRentalSystem.createBooking(
      bookingId: "1",
      customer: customer1,
      car: car1,
      startDate: DateTime(2025, 2, 1),
      endDate: DateTime(2025, 2, 8));

  carRentalSystem.displayAvailableCars(); //car2

//Repeated Booking Id
  carRentalSystem.createBooking(
      bookingId: "1",
      customer: customer2,
      car: car2,
      startDate: DateTime(2025, 2, 1),
      endDate: DateTime(2025, 2, 8));

//Unavailable Car
  carRentalSystem.createBooking(
      bookingId: "2",
      customer: customer2,
      car: car1,
      startDate: DateTime(2025, 2, 1),
      endDate: DateTime(2025, 2, 8));

//unExisted Car
  carRentalSystem.createBooking(
      bookingId: "3",
      customer: customer2,
      car: car3,
      startDate: DateTime(2025, 2, 1),
      endDate: DateTime(2025, 2, 8));

//unRegisted Customer
  carRentalSystem.createBooking(
      bookingId: "3",
      customer: customer3,
      car: car2,
      startDate: DateTime(2025, 2, 1),
      endDate: DateTime(2025, 2, 8));

//Already Existed Car
  carRentalSystem.addCar(car2);

//Already Existed Custumer
  carRentalSystem.registerCustomer(customer2);

//Add Car and Customer
  carRentalSystem.addCar(car3);
  carRentalSystem.registerCustomer(customer3);

//return car1 with no additional fees
  carRentalSystem.returnCar(bookingId: "1", rentalDuration: Duration(days: 3));
  carRentalSystem.displayAvailableCars(); //car1 car2 car3

//Book car2
  carRentalSystem.createBooking(
      bookingId: "2",
      customer: customer2,
      car: car2,
      startDate: DateTime(2025, 2, 10),
      endDate: DateTime(2025, 2, 13));

//Book car3
  carRentalSystem.createBooking(
      bookingId: "3",
      customer: customer2,
      car: car3,
      startDate: DateTime(2025, 2, 10),
      endDate: DateTime(2025, 2, 13));

  carRentalSystem.displayAvailableCars(); //car1

//return car2 with additional fees
  carRentalSystem.returnCar(
      bookingId: "2", rentalDuration: Duration(days: 5), usedDistance: 20);

//return car3 with additional fees
  carRentalSystem.returnCar(bookingId: "3", rentalDuration: Duration(days: 5));

//Generate Report
  carRentalSystem.generateReport();
}
