part of 'hotel_bloc.dart';

abstract class HotelState {}

class HotelInitialState extends HotelState {}
class HotelSuccessState extends HotelState {
  final HotelScreenData data;
  HotelSuccessState(this.data);
}
class HotelLoadingState extends HotelState {}
class HotelFailedState extends HotelState {
  final dynamic error;
  HotelFailedState(this.error);
}

