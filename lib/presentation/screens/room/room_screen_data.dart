class RoomsScreenData {
  List<RoomScreenData> listRoomScreenData;

  RoomsScreenData(
    this.listRoomScreenData,
  );

  static RoomsScreenData init() => RoomsScreenData(
        [],
      );
}

class RoomScreenData {
  int id;
  String name;
  int price;
  String pricePer;
  List<String> peculiarities;
  List<String> imageUrls;

  RoomScreenData(
    this.id,
    this.name,
    this.price,
    this.pricePer,
    this.peculiarities,
    this.imageUrls,
  );

  static RoomScreenData init() => RoomScreenData(
        0,
        '',
        0,
        '',
        [],
        [],
      );
}
