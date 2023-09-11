
import 'package:get_it/get_it.dart';

import 'hotel_view_mapper.dart';

void initHotelModule() {
  final getIt = GetIt.I;
  getIt.registerLazySingleton<HotelViewMapper>(() => HotelViewMapper());
}
