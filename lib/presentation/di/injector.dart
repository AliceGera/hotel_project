import 'package:hotel/presentation/screens/hotel/hotel_module.dart';
import 'package:hotel/presentation/screens/room/room_module.dart';

import '../screens/booking/booking_module.dart';

Future<void> configurePresentationDependencies() async {
  initHotelModule();
  initRoomModule();
  initBookingModule();
}
