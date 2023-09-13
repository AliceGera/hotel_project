import 'dart:core';

abstract class BookingEvent {}

class LoadBookingEvent extends BookingEvent {}

class AddTouristEvent extends BookingEvent {
  AddTouristEvent();
}

class AddUpdateFieldsEvent extends BookingEvent {
  final int touristIndex;
  final String? name;
  final String? lastName;
  final String? birthday;
  final String? nationality;
  final String? passportNumber;
  final String? passportValidityPeriod;
  final String? errorName;
  final String? errorLastName;
  final String? errorBirthday;
  final String? errorNationality;
  final String? errorPassportNumber;
  final String? errorPassportValidityPeriod;

  AddUpdateFieldsEvent({
    required this.touristIndex,
    this.errorPassportNumber,
    this.errorNationality,
    this.errorBirthday,
    this.errorLastName,
    this.errorName,
    this.name,
    this.passportValidityPeriod,
    this.passportNumber,
    this.nationality,
    this.birthday,
    this.lastName,
    this.errorPassportValidityPeriod,
  });
}
