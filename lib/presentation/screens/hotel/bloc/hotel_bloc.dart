import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/interactor/hotel_interactor.dart';
import '../hotel_screen_data.dart';
import '../hotel_view_mapper.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  HotelScreenData screenData = HotelScreenData.init();
  final HotelInteractor interactor;
  final HotelViewMapper viewMapper;

  HotelBloc(
    this.interactor,
    this.viewMapper,
  ) : super(HotelInitialState()) {
    on<LoadHotelEvent>((event, emit) async {
      emit(HotelLoadingState());
      try {
        final data = await interactor.getHotel();
        screenData = viewMapper.toScreenData(
          screenData,
          data,
        );
        screenData = HotelScreenData(
          screenData.name ?? '',
          screenData.adress ?? '',
          screenData.minimalPrice ?? 0,
          screenData.priceForIt ?? '',
          screenData.rating ?? 0,
          screenData.ratingName ?? '',
          screenData.imageUrls ?? [],
          screenData.description ?? '',
          screenData.peculiarities ?? [],
        );
        emit(HotelSuccessState(screenData));
      } catch (error) {
        emit(HotelFailedState(error.toString()));
      }
    });
  }
}
