/*
import 'package:hotel/data/mapper/global_mapper.dart';

import '../../domain/model/hotel_data.dart';
import '../../domain/model/room_data.dart';
import '../../domain/repository/hotel_repository.dart';
import '../api/api_client.dart';
import '../model/api_hotel_response.dart';
import '../model/api_room_response.dart';

class ApiGlobalRepository implements IGlobalRepository {
  final HttpRequestExecutor httpRequestExecutor;
  final IGlobalMapper globalMapper;

  ApiGlobalRepository(
    this.httpRequestExecutor,
    this.globalMapper,
  );

  @override
  Future<HotelData> getHotel() async {
    final response = await httpRequestExecutor.executeRequest(
      HttpMethod.get,
      Uri.parse("https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3"),
      null,
    );

    final mappedResponse = ApiHotelResponse.fromJson(response);
    final hotelData = globalMapper.toHotelData(mappedResponse);
    return hotelData;
  }


}
*/
