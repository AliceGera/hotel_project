class ApiBookingResponse {
  final String? hotelName;
  final String? hotelAdress;
  final int? horating;
  final String? ratingName;
  final String? departure;
  final String? arrivalCountry;
  final String? tourDateStart;
  final String? tourDateStop;
  final int? numberOfNights;
  final String? room;
  final String? nutrition;
  final int? tourPrice;
  final int? fuelCharge;
  final int? serviceCharge;


  ApiBookingResponse(
      this.hotelName,
      this.hotelAdress,
      this.horating,
      this.ratingName,
      this.departure,
      this.arrivalCountry,
      this.tourDateStart,
      this.tourDateStop,
      this.numberOfNights,
      this.room,
      this.nutrition,
      this.tourPrice,
      this.fuelCharge,
      this.serviceCharge,
  );

  factory ApiBookingResponse.fromJson(
    Map<String, dynamic> json,
  ) {
   return ApiBookingResponse(
      json['hotel_name'] as String?,
      json['hotel_adress'] as String?,
      json['horating'] as int?,
      json['rating_name'] as String?,
      json['departure'] as String?,
      json['arrival_country'] as String?,
     json['tour_date_start'] as String?,
     json['tour_date_stop'] as String?,
     json['number_of_nights'] as int?,
     json['room'] as String?,
     json['nutrition'] as String?,
     json['tour_price'] as int?,
     json['fuel_charge'] as int?,
     json['service_charge'] as int?,
     );
  }
}
