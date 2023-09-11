import '../../../domain/model/booking_data.dart';
import 'booking_screen_data.dart';


abstract class BookingViewMapper {
  factory BookingViewMapper() => _BookingViewMapper();

  BookingScreenData toScreenData(
      BookingScreenData screenData,
      BookingData data,
  );
}

class _BookingViewMapper implements BookingViewMapper {
  @override
  BookingScreenData toScreenData(
      BookingScreenData screenData,
      BookingData data,
  ) {
    return BookingScreenData(
       data.hotelName ?? '',
     data.hotelAdress ?? '',
       data.horating ?? 0,
      data.ratingName ?? '',
       data.departure ?? '',
       data.arrivalCountry ?? '',
       data.tourDateStart ?? '',
       data.tourDateStop ?? '',
       data.numberOfNights ?? 0,
       data.room ?? '',
       data.nutrition ?? '',
       data.tourPrice ?? 0,
       data.fuelCharge ?? 0,
       data.serviceCharge ?? 0,
    );
  }
}
