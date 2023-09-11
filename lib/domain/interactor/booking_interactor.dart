
import '../model/booking_data.dart';
import '../repository/hotel_repository.dart';

class BookingInteractor {
  final IGlobalRepository bookingRepository;

  BookingInteractor(this.bookingRepository);

  Future<BookingData> getBooking() {
    return bookingRepository.getBooking();
  }
}
