class ApiHotelResponse {
  final String? name;
  final String? adress;
  final int? minimalPrice;
  final String? priceForIt;
  final int? rating;
  final String? ratingName;
  final List<String>? imageUrls;
  final String? description;
  final List<String>? peculiarities;

  ApiHotelResponse(
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

  factory ApiHotelResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    final aboutTheHotel = json["about_the_hotel"] as Map<String, dynamic>?;
    final imageUrls = json['image_urls'] as List<dynamic>?;
    final peculiarities = aboutTheHotel?['peculiarities'] as List<dynamic>?;
    return ApiHotelResponse(
      json['name'] as String?,
      json['adress'] as String?,
      json['minimal_price'] as int?,
      json['price_for_it'] as String?,
      json['rating'] as int?,
      json['rating_name'] as String?,
      imageUrls?.map((e) => e as String).toList(),
      aboutTheHotel?['description'] as String?,
      peculiarities?.map((e) => e as String).toList(),
    );
  }
}
