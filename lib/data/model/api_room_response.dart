class ApiRoomResponse {
  final int? id;
  final String? name;
  final int? price;
  final String? pricePer;
  final List<String>? peculiarities;
  final List<String>? imageUrls;

  ApiRoomResponse(
    this.id,
    this.name,
    this.price,
    this.pricePer,
    this.peculiarities,
    this.imageUrls,
  );

  factory ApiRoomResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    final peculiarities = json["peculiarities"] as List<dynamic>?;
    final imageUrls = json['image_urls'] as List<dynamic>?;
    return ApiRoomResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['price'] as int?,
      json['price_per'] as String?,
      peculiarities?.map((e) => e as String).toList(),
      imageUrls?.map((e) => e as String).toList(),
    );
  }
}
