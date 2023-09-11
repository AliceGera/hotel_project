import 'package:hotel/domain/repository/hotel_repository.dart';
import '../model/room_data.dart';

class RoomInteractor {
  final IGlobalRepository globalRepository;

  RoomInteractor(this.globalRepository);

  Future<List<RoomData>> getRooms() {
    return globalRepository.getRooms();
  }
}
