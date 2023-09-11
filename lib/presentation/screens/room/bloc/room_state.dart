
import '../room_screen_data.dart';

abstract class RoomState {}

class RoomInitialState extends RoomState {}
class RoomSuccessState extends RoomState {
  final RoomsScreenData data;
  RoomSuccessState(this.data);
}
class RoomLoadingState extends RoomState {}
class RoomFailedState extends RoomState {
  final dynamic error;
  RoomFailedState(this.error);
}

