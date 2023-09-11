import '../model/booking_data.dart';
import '../model/hotel_data.dart';
import '../model/room_data.dart';

abstract class IGlobalRepository {
  Future<HotelData> getHotel();
  Future<List<RoomData>> getRooms();
  Future<BookingData> getBooking();
}
