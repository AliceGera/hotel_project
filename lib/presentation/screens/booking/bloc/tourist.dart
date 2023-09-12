class Tourist {
  String name;
  String lastName;
  String birthday;
  String nationality;
  String passportNumber;
  String passportValidityPeriod;

  Tourist(
    this.name,
    this.lastName,
    this.birthday,
    this.nationality,
    this.passportNumber,
    this.passportValidityPeriod,
  );

  factory Tourist.init() => Tourist(
        '',
        '',
        '',
        '',
        '',
        '',
      );
}
