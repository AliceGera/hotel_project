class HotelScreenData {

  String name;
  String adress;
  int minimalPrice;
  String priceForIt;
  int rating;
  String ratingName;
  List<String> imageUrls;
  String description;
  List<String> peculiarities;

  HotelScreenData(
      this.name,
      this.adress,
      this.minimalPrice,
      this.priceForIt,
      this.rating,
      this.ratingName,
      this.imageUrls,
      this.description,
      this.peculiarities,
      );
  static HotelScreenData init() => HotelScreenData(
    '',
    '',
    0,
    '',
    0,
    '',
    [],
    '',
    [],
  );
}
