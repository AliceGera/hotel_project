import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/interactor/booking_interactor.dart';
import '../booking_screen_data.dart';
import '../booking_view_mapper.dart';
import 'booking_event.dart';
import 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingScreenData screenData = BookingScreenData.init();
  final BookingInteractor interactor;
  final BookingViewMapper viewMapper;

  BookingBloc(
      this.interactor,
      this.viewMapper,
      ) : super(BookingInitialState()) {
    on<LoadBookingEvent>((event, emit) async {
      emit(BookingLoadingState());
      try {
        final data = await interactor.getBooking();
        screenData = viewMapper.toScreenData(
          screenData,
          data,
        );
        screenData = BookingScreenData(
          screenData.hotelName ?? '',
          screenData.hotelAdress ?? '',
          screenData.horating ?? 0,
          screenData.ratingName ?? '',
          screenData.departure ?? '',
          screenData.arrivalCountry ?? '',
          screenData.tourDateStart ?? '',
          screenData.tourDateStop ?? '',
          screenData.numberOfNights ?? 0,
          screenData.room ?? '',
          screenData.nutrition ?? '',
          screenData.tourPrice ?? 0,
          screenData.fuelCharge ?? 0,
          screenData.serviceCharge ?? 0,
        );
        emit(BookingSuccessState(screenData));
      } catch (error) {
        emit(BookingFailedState(error.toString()));
      }
    });
  }
}
