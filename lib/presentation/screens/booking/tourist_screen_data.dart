class Tourist {
  String name;
  String? errorName;
  String lastName;
  String? errorLastName;
  String birthday;
  String? errorBirthday;
  String nationality;
  String? errorNationality;
  String passportNumber;
  String? errorPassportNumber;
  String passportValidityPeriod;
  String? errorPassportValidityPeriod;

  bool get isDataValid =>
      errorName == null &&
      errorLastName == null &&
      errorBirthday == null &&
      errorNationality == null &&
      errorPassportNumber == null &&
      errorPassportValidityPeriod == null;

  Tourist(
    this.name,
    this.lastName,
    this.birthday,
    this.nationality,
    this.passportNumber,
    this.passportValidityPeriod,
    this.errorName,
    this.errorLastName,
    this.errorBirthday,
    this.errorNationality,
    this.errorPassportNumber,
    this.errorPassportValidityPeriod,
  );

  factory Tourist.init() => Tourist(
        '',
        '',
        '',
        '',
        '',
        '',
        'Введите имя',
        'Введите фамилию',
        'Введите дату рождения',
        'Введите гражданство',
        'Введите номер загранпаспорта',
        'Введите срок действия загранпаспорта',
      );

  Tourist copy({
    String? name,
    String? lastName,
    String? birthday,
    String? nationality,
    String? passportNumber,
    String? passportValidityPeriod,
    String? errorName,
    String? errorLastName,
    String? errorBirthday,
    String? errorNationality,
    String? errorPassportNumber,
    String? errorPassportValidityPeriod,
  }) =>
      Tourist(
        name ?? this.name,
        lastName ?? this.lastName,
        birthday ?? this.birthday,
        nationality ?? this.nationality,
        passportNumber ?? this.passportNumber,
        passportValidityPeriod ?? this.passportValidityPeriod,
        errorName != null && errorName.isEmpty ? null : errorName ?? this.errorName,
        errorLastName != null && errorLastName.isEmpty ? null : errorLastName ?? this.errorLastName,
        errorBirthday != null && errorBirthday.isEmpty ? null : errorBirthday ?? this.errorBirthday,
        errorNationality != null && errorNationality.isEmpty ? null : errorNationality ?? this.errorNationality,
        errorPassportNumber != null && errorPassportNumber.isEmpty ? null : errorPassportNumber ?? this.errorPassportNumber,
        errorPassportValidityPeriod != null && errorPassportValidityPeriod.isEmpty ? null : errorPassportValidityPeriod ?? this.errorPassportValidityPeriod,
      );
}
