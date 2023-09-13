import 'package:bloc/bloc.dart';
import 'package:hotel/presentation/screens/room/bloc/room_event.dart';
import 'package:hotel/presentation/screens/room/bloc/room_state.dart';
import '../../../../domain/interactor/room_interactor.dart';
import '../room_screen_data.dart';
import '../room_view_mapper.dart';



class RoomBloc extends Bloc<RoomEvent, RoomState> {
  RoomsScreenData screenData = RoomsScreenData.init();
  final RoomInteractor interactor;
  final RoomViewMapper viewMapper;

  RoomBloc(
      this.interactor,
      this.viewMapper,
      ) : super(RoomInitialState()) {
    on<LoadRoomEvent>((event, emit) async {
      emit(RoomLoadingState());
      try {
        /*final data = await interactor.getRooms();
        screenData = viewMapper.toScreenData(
          screenData,
          data,
        );*/

        emit(RoomSuccessState(screenData));
      } catch (error) {
        emit(RoomFailedState(error.toString()));
      }
    });
  }
}
