import 'package:hotel/presentation/screens/room/room_screen_data.dart';

import '../../../domain/model/room_data.dart';

abstract class RoomViewMapper {
  factory RoomViewMapper() => _RoomViewMapper();

  RoomsScreenData toScreenData(
    RoomsScreenData screenData,
    List<RoomData> data,
  );
}

class _RoomViewMapper implements RoomViewMapper {
  @override
  RoomsScreenData toScreenData(
    RoomsScreenData screenData,
    List<RoomData> data,
  ) {
    final list = data.map(
      (e) => RoomScreenData(
        e.id ?? 0,
        e.name ?? '',
        e.price ?? 0,
        e.pricePer ?? '',
        e.peculiarities ?? [],
        e.imageUrls ?? [],
      ),
    ).toList();
    return RoomsScreenData(list);
  }
}
