import '../../../domain/model/hotel_data.dart';
import 'hotel_screen_data.dart';

abstract class HotelViewMapper {
  factory HotelViewMapper() => _HotelViewMapper();

  HotelScreenData toScreenData(
    HotelScreenData screenData,
    HotelData data,
  );
}

class _HotelViewMapper implements HotelViewMapper {
  @override
  HotelScreenData toScreenData(
    HotelScreenData screenData,
    HotelData data,
  ) {
    return HotelScreenData(
      data.name ?? '',
      data.adress ?? '',
      data.minimalPrice ?? 0,
      data.priceForIt ?? '',
      data.rating ?? 0,
      data.ratingName ?? '',
      data.imageUrls ?? [],
      data.description ?? '',
      data.peculiarities ?? [],
    );
  }
}
