
import '../model/hotel_data.dart';
import '../repository/hotel_repository.dart';

class HotelInteractor {
  final IGlobalRepository hotelRepository;

  HotelInteractor(this.hotelRepository);

  Future<HotelData> getHotel() {
    return hotelRepository.getHotel();
  }
}
