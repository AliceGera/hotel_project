import '../../domain/model/booking_data.dart';
import '../../domain/model/hotel_data.dart';
import '../../domain/model/room_data.dart';
import '../model/api_hotel_response.dart';
import '../model/api_room_response.dart';
import '../model/api_booking_response.dart';

abstract class IGlobalMapper {
  factory IGlobalMapper() => _IGlobalMapper();

  HotelData toHotelData(ApiHotelResponse data);

  List<RoomData> toListRoomData(List<ApiRoomResponse> response);

  BookingData toBookingData(ApiBookingResponse data);
}

class _IGlobalMapper implements IGlobalMapper {
  @override
  List<RoomData> toListRoomData(List<ApiRoomResponse> response) {
    final listRoomData = response
        .map(
          (e) => RoomData(
            id: e.id,
            name: e.name,
            price: e.price,
            pricePer: e.pricePer,
            peculiarities: e.peculiarities,
            imageUrls: e.imageUrls,
          ),
        )
        .toList();
    return listRoomData;
  }

  @override
  HotelData toHotelData(ApiHotelResponse data) {
    return HotelData(
      name: data.name,
      adress: data.adress,
      minimalPrice: data.minimalPrice,
      priceForIt: data.priceForIt,
      rating: data.rating,
      ratingName: data.ratingName,
      imageUrls: data.imageUrls,
      description: data.description,
      peculiarities: data.peculiarities,
    );
  }

  @override
  BookingData toBookingData(ApiBookingResponse data) {
    return BookingData(
      hotelName: data.hotelName,
      hotelAdress: data.hotelAdress,
      horating: data.horating,
      ratingName: data.ratingName,
      departure: data.departure,
      arrivalCountry: data.arrivalCountry,
      tourDateStart: data.tourDateStart,
      tourDateStop: data.tourDateStop,
      numberOfNights: data.numberOfNights,
      room: data.room,
      nutrition: data.nutrition,
      tourPrice: data.tourPrice,
      fuelCharge: data.fuelCharge,
      serviceCharge: data.serviceCharge,
    );
  }
}
