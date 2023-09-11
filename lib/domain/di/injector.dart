import 'package:get_it/get_it.dart';

import '../interactor/booking_interactor.dart';
import '../interactor/hotel_interactor.dart';
import '../interactor/room_interactor.dart';
import '../repository/hotel_repository.dart';

Future<void> configureDomainDependencies() async {
  final getIt = GetIt.I;

  getIt.registerLazySingleton<HotelInteractor>(
    () => HotelInteractor(
      getIt.get<IGlobalRepository>(),
    ),
  );
  getIt.registerLazySingleton<RoomInteractor>(
    () => RoomInteractor(
      getIt.get<IGlobalRepository>(),
    ),
  );
  getIt.registerLazySingleton<BookingInteractor>(
        () => BookingInteractor(
      getIt.get<IGlobalRepository>(),
    ),
  );
}
