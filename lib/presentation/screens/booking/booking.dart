import 'package:flutter/material.dart';

import '../../../widgets/information_widget_about_booking.dart';
import '../paid/paid.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  List<String> hotelImages = [
    'hotel.png',
    'hotel.png',
    'hotel.png',
  ];
  List<String> text = [
    'Удобства',
    'Что включено',
    'Что не включено',
  ];

  List<String> icons = [
    'smile.png',
    'check.png',
    'close-square.png',
  ];

  final controller = PageController(keepPage: true);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pages = List.generate(
      6,
      (index) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        margin: EdgeInsets.symmetric(horizontal: 1),
        child: AspectRatio(
          aspectRatio: 343 / 257,
          child: Image.asset(
            'assets/images/${hotelImages[1]}',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
    /*return BlocProvider(*/
    /*create: (context) => PokemonScreenBloc(
        GetIt.I.get<PokemonInteractor>(),
        GetIt.I.get<PokemonViewMapper>(),
      )..add(
        LoadMorePokemonsScreenEvent(true),
      ),*/
    /*child: BlocBuilder<PokemonScreenBloc, PokemonScreenState>(
        builder: (context, state) {
          if (state is PokemonScreenInitialState) {
            setupScrollController(context);
          }
          if (state is PokemonScreenLoadingState || state is PokemonScreenInitialState) {
            return const CircularProgressIndicatorWidget();
          } else if (state is PokemonScreenFailedState) {
            return FailedWidget(
              tapCallBack: () {
                BlocProvider.of<PokemonScreenBloc>(context).add(
                  LoadMorePokemonsScreenEvent(true),
                );
              },
              error: state.error,
            );
          } else if (state is PokemonScreenSuccessState) {*/
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Бронирование',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                color: const Color(0xffF6F6F9),
                child: ListView(
                  children: [
                    SizedBox(height: size.height * .01),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFA800).withOpacity(.2),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/images/star.png',
                                      height: 15,
                                    ),
                                    const Text(
                                      '5 Превосходно',
                                      style: TextStyle(
                                        color: Color(0xFFFFA800),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          const Text(
                            'Steigenberger Makadi',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8, bottom: 16),
                            child: Text(
                              'Madinat Makadi, Safaga Road, Makadi Bay, Египет',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xFF0D72FF),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * .01),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child:  const Column(
                        children: [
                          InformationWidgetAboutBooking(firstText: 'Вылет из', secondText: 'Санкт-Петербург'),
                          InformationWidgetAboutBooking(firstText: 'Страна, город', secondText: 'Египет, Хургада'),
                          InformationWidgetAboutBooking(firstText: 'Даты', secondText: '19.09.2023 – 27.09.2023'),
                          InformationWidgetAboutBooking(firstText: 'Кол-во ночей', secondText: '7 ночей'),
                          InformationWidgetAboutBooking(firstText: 'Отель', secondText: 'Steigenberger Makadi'),
                          InformationWidgetAboutBooking(firstText: 'Номер', secondText: 'Стандартный с видом на бассейн или сад'),
                          InformationWidgetAboutBooking(firstText: 'Питание', secondText: 'Все включено'),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * .02),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Информация о покупателе',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                           Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '+7 (***) ***-**-**',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '+7 (***) ***-**-**',
                                labelText: 'Enter your username',
                              ),
                            ),
                          ),
                          Text(
                            'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                            style: TextStyle(
                              color: Color(0xFF828796),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * .02),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 12, bottom: 28),
              color: Colors.white,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    return const Color(0xFF0D72FF);
                  }),
                  padding: MaterialStateProperty.resolveWith((states) {
                    return EdgeInsets.zero;
                  }),
                  shape: MaterialStateProperty.resolveWith((states) {
                    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(16));
                  }),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PaidScreen()));
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Оплатить 198 036 ₽',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
