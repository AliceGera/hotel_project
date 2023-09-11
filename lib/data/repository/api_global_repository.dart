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

  @override
  Future<List<RoomData>> getRooms() async {  //List RoomData
    final response = await httpRequestExecutor.executeRequest(
      HttpMethod.get,
      Uri.parse("https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd"),
      null,
    );
    final rooms = response['rooms'] as List<dynamic>?;
    final mappedRoomList = rooms?.map((e) => ApiRoomResponse.fromJson(e)).toList();
    final roomData = globalMapper.toListRoomData(mappedRoomList!); //List RoomData
    return roomData; //List RoomData
  }
}
