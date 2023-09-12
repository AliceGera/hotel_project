import 'package:hotel/presentation/screens/booking/bloc/tourist.dart';

class BookingScreenData {
  String hotelName;
  String hotelAdress;
  int horating;
  String ratingName;
  String departure;
  String arrivalCountry;
  String tourDateStart;
  String tourDateStop;
  int numberOfNights;
  String room;
  String nutrition;
  int tourPrice;
  int fuelCharge;
  int serviceCharge;
  List<Tourist> tourists;

  BookingScreenData(
    this.hotelName,
    this.hotelAdress,
    this.horating,
    this.ratingName,
    this.departure,
    this.arrivalCountry,
    this.tourDateStart,
    this.tourDateStop,
    this.numberOfNights,
    this.room,
    this.nutrition,
    this.tourPrice,
    this.fuelCharge,
    this.serviceCharge,
    this.tourists,
  );

  static BookingScreenData init() => BookingScreenData(
        '',
        '',
        0,
        '',
        '',
        '',
        '',
        '',
        0,
        '',
        '',
        0,
        0,
        0,
        [
          Tourist.init(),
        ],
      );
}
