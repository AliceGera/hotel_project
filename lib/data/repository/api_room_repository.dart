/*
import 'package:hotel/data/mapper/global_mapper.dart';

import '../../domain/model/hotel_data.dart';
import '../../domain/model/room_data.dart';
import '../../domain/repository/hotel_repository.dart';
import '../api/api_client.dart';
import '../model/api_hotel_response.dart';
import '../model/api_room_response.dart';

class ApiRoomRepository implements IGlobalRepository {
  final HttpRequestExecutor httpRequestExecutor;
  final IRoomMapper roomMapper;

  ApiGlobalRepository(
    this.httpRequestExecutor,
    this.globalMapper,
  );

  @override
  Future<List<RoomData>> getRooms() async {  //List RoomData
    final response = await httpRequestExecutor.executeRequest(
      HttpMethod.get,
      Uri.parse("https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3"),
      null,
    );
    final rooms = response['rooms'] as List<dynamic>?;
    final mappedRoomList = rooms?.map((e) => ApiRoomResponse.fromJson(e)).toList();
    final roomData = globalMapper.toListRoomData(mappedRoomList!); //List RoomData
    return roomData; //List RoomData
  }
}
*/
