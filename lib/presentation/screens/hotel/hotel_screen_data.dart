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
        'Atlantis The Royal',
        'Crescent Road Palm Jumeirah, Пальма Джумейра, Дубай, ОАЭ ',
        234673,
        'за тур с перелётом',
        5,
        'Превосходно',
        [
          'https://cf.bstatic.com/xdata/images/hotel/max1280x900/429337541.jpg?k=25a18de7dbf7df9b716b2a6d1e307d1402c468144b3903829fb3b80e4701b39e&o=&hp=1',
          'https://cf.bstatic.com/xdata/images/hotel/max1280x900/387468836.jpg?k=1056eb09c224a7069c9cbe60af57f3876921e56959915e536cbcae581d56bb30&o=&hp=1',
          'https://cf.bstatic.com/xdata/images/hotel/max1280x900/208602465.jpg?k=65b70919d33347c3011091c439cb399556901943590c38a787ac0bfa8446185f&o=&hp=1',
          'https://cf.bstatic.com/xdata/images/hotel/max1280x900/387467286.jpg?k=ae28171e7a956d4ad3e9e17ca46fdc2b89cd3802e94166bec37e9f520a71a93a&o=&hp=1',
          'https://cf.bstatic.com/xdata/images/hotel/max1280x900/435506491.jpg?k=7e19a734093e68ef61e8740a70b3cc36c2167a37b7d3e4b4eae2802ad3191c37&o=&hp=1',
          'https://cf.bstatic.com/xdata/images/hotel/max1280x900/387467175.jpg?k=80b45e6438dfcb11bdc8cdf804aa26af0ff1beb1f6313df3962381e5a0058841&o=&hp=1',
        ],
        'Курортный отель Atlantis The Royal расположен на полумесяце искусственного острова Пальма Джумейра в Дубае, рядом с отелем Atlantis, The Palm и аквапарком Aquaventure. К услугам гостей доступ в аквапарк Aquaventure (крупнейший аквапарк на Ближнем Востоке), 17 ресторанов и баров, ночные клубы, шоу фонтанов, открытые бассейны, пляжные клубы, ультрасовременный спа-центр и бесплатная частная парковка. В этом 5-звездочном курортном отеле предоставляется бесплатный Wi-Fi, работают круглосуточная стойка регистрации и пункт обмена валюты. Гости могут посетить бассейн с панорамным видом и частный пляж. Осуществляется доставка еды и напитков в номер. В некоторых номерах обустроена кухня с мини-баром.',
        [
          '4 бассейна',
          'Трансфер от/до аэропорта',
          'Фитнес-центр',
          'Пляж (первая линия)',
          'Бар',
          'Частная пляжная зона',
          '5 ресторанов',
        ],
      );
}
