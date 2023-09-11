import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/interactor/booking_interactor.dart';
import '../../../widgets/information_widget_about_booking.dart';
import '../paid/paid.dart';
import 'bloc/booking_bloc.dart';
import 'bloc/booking_event.dart';
import 'bloc/booking_state.dart';
import 'booking_view_mapper.dart';

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
    return BlocProvider(
        create: (context) => BookingBloc(
          GetIt.I.get<BookingInteractor>(),
          GetIt.I.get<BookingViewMapper>(),
        )..add(
          LoadBookingEvent(),
        ),
        child: BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) {
      if (state is BookingLoadingState || state is BookingInitialState) {
        return Container(
          child: Text('load'),
        );
      } else if (state is BookingFailedState) {
        return Container(
          child: Text('load'),
        );
      } else if (state is BookingSuccessState) {
        return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
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
                                     Text(
                                      '${state.data.horating} Превосходно',
                                      style: const TextStyle(
                                        color: Color(0xFFFFA800),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                           Text(
                             state.data.hotelName,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                            ),
                          ),
                           Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 16),
                            child: Text(
                              state.data.hotelAdress,
                              style: const TextStyle(
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
                      child:   Column(
                        children: [
                          InformationWidgetAboutBooking(firstText: 'Вылет из', secondText: state.data.departure),
                          InformationWidgetAboutBooking(firstText: 'Страна, город', secondText: state.data.arrivalCountry),
                          InformationWidgetAboutBooking(firstText: 'Даты', secondText: "${state.data.tourDateStart} - ${state.data.tourDateStop}"),
                          InformationWidgetAboutBooking(firstText: 'Кол-во ночей', secondText: "${state.data.numberOfNights}"),
                          InformationWidgetAboutBooking(firstText: 'Отель', secondText: state.data.hotelName),
                          InformationWidgetAboutBooking(firstText: 'Номер', secondText:  state.data.room),
                          InformationWidgetAboutBooking(firstText: 'Питание', secondText: state.data.nutrition),
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
      return const SizedBox();
        },
        ),
    );
  }
}
