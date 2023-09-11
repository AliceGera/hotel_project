

import '../booking_screen_data.dart';

abstract class BookingState {}

class BookingInitialState extends BookingState {}
class BookingSuccessState extends BookingState {
  final BookingScreenData data;
  BookingSuccessState(this.data);
}
class BookingLoadingState extends BookingState {}
class BookingFailedState extends BookingState {
  final dynamic error;
  BookingFailedState(this.error);
}

