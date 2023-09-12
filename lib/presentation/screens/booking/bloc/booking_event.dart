import 'package:hotel/presentation/screens/booking/bloc/tourist.dart';
abstract class BookingEvent {}
class LoadBookingEvent extends BookingEvent {}
class AddTouristEvent extends BookingEvent {

  AddTouristEvent();
}