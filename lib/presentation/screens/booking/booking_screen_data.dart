import 'package:hotel/presentation/screens/booking/tourist_screen_data.dart';

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
        'Atlantis The Royal',
        'Crescent Road Palm Jumeirah, Пальма Джумейра, Дубай, ОАЭ ',
        5,
        'Санкт-Петербург',
        'Санкт-Петербург',
        'ОАЭ, Дубай',
        '19.09.2023',
        '27.09.2023',
        7,
        'Стандартный номер с кроватью размера «king-size» и видом на море',
        'Все включено',
    534595,
    12334,
        3400,
        [
          Tourist.init(),
        ],
      );
}
