class RoomsScreenData {
  List<RoomScreenData> listRoomScreenData;

  RoomsScreenData(
    this.listRoomScreenData,
  );

  static RoomsScreenData init() => RoomsScreenData(
        [
          //////
          RoomScreenData.init(),
          RoomScreenData.init(),
        ],
        //////////////////
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
        'Номер с кроватью размера «king-size» и видом на море',
        534595,
        'за 7 ночей с перелётом',
        ['Все включено', 'Кондиционер', '54m²'],
        [
          'https://cf.bstatic.com/xdata/images/hotel/max1280x900/435506452.jpg?k=bee0b79e694d1e8cee383776962c9d85c0ca3c301d364c99b7664ee94bb5cc94&o=&hp=1',
          'https://cf.bstatic.com/xdata/images/hotel/max1280x900/435506438.jpg?k=0efafd5fe17efe87819c9e7ec1388b74162aca717d1fdcaf0ebbf0f0408d6eb2&o=&hp=1',
          'https://cf.bstatic.com/xdata/images/hotel/max1280x900/435506453.jpg?k=331d455dd31868792957e6702b0ccfae0c39a5491cb17aa26bad0d0ff924a472&o=&hp=1',
          'https://cf.bstatic.com/xdata/images/hotel/max1280x900/386039933.jpg?k=d43db674ddffdb7ad5c29e2475a21c7f60083ddc24e95efbea1dac77b171a724&o=&hp=1',
        ],
      );
}
