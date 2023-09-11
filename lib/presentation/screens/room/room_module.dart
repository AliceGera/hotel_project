import 'package:get_it/get_it.dart';
import 'package:hotel/presentation/screens/room/room_view_mapper.dart';

void initRoomModule() {
  final getIt = GetIt.I;
  getIt.registerLazySingleton<RoomViewMapper>(() => RoomViewMapper());
}
