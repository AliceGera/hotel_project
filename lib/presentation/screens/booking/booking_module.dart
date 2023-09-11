
import 'package:get_it/get_it.dart';

import 'booking_view_mapper.dart';



void initBookingModule() {
  final getIt = GetIt.I;
  getIt.registerLazySingleton<BookingViewMapper>(() => BookingViewMapper());
}
