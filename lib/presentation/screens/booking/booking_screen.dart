import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel/presentation/extension/int_extension.dart';
import 'package:hotel/presentation/extension/string_extension.dart';
import 'package:hotel/presentation/screens/booking/widgets/button_booking_widget.dart';
import 'package:hotel/presentation/screens/booking/widgets/text_field_widget.dart';
import 'package:hotel/presentation/screens/booking/widgets/tourist_widget.dart';
import 'package:hotel/presentation/screens/paid/paid.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../domain/interactor/booking_interactor.dart';
import '../../../widgets/information_widget_about_booking.dart';
import '../../widgets/load_more_indicator_widget.dart';
import '../hotel/widgets/price_widget.dart';
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
  final Color colorBlue = const Color(0xFF0D72FF);
  final Color colorBlack = Colors.black;

  List<String> icons = [
    'smile.png',
    'check.png',
    'close-square.png',
  ];

  final controller = PageController(keepPage: true);
  late int count = 1;
  final mask = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {'#': RegExp('[0-9]')},
  );
  final textFieldNumberKey = GlobalKey<FormState>();
  final textFieldEmailKey = GlobalKey<FormState>();
  final _controllerEmail = TextEditingController();
  final _controllerNumber = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controllerNumber.addListener(_listenerNumber);
    _controllerEmail.addListener(_listenerEmail);
  }

  void _listenerNumber() {}

  void _listenerEmail() {}

  final valueNotifier = ValueNotifier<bool>(false);

  final globalKeys = [GlobalKey(), GlobalKey()];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => BookingBloc(
        GetIt.I.get<BookingInteractor>(),
        GetIt.I.get<BookingViewMapper>(),
      )..add(LoadBookingEvent()),
      child: BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) {
          if (state is BookingLoadingState || state is BookingInitialState) {
            return const CircularProgressIndicatorWidget();
          } else if (state is BookingFailedState) {
            return const Center(
              child: Text('Failed load'),
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
                body: InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                            color: const Color(0xffF6F6F9),
                            child: ListView(
                              shrinkWrap: true,
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
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8),
                                        child: Text(
                                          state.data.hotelName,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 22,
                                          ),
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
                                const SizedBox(height: 8),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  child: Column(
                                    children: [
                                      InformationWidgetAboutBooking(firstText: 'Вылет из', secondText: state.data.departure),
                                      InformationWidgetAboutBooking(firstText: 'Страна, город', secondText: state.data.arrivalCountry),
                                      InformationWidgetAboutBooking(firstText: 'Даты', secondText: "${state.data.tourDateStart} - ${state.data.tourDateStop}"),
                                      InformationWidgetAboutBooking(firstText: 'Кол-во ночей', secondText: "${state.data.numberOfNights}"),
                                      InformationWidgetAboutBooking(firstText: 'Отель', secondText: state.data.hotelName),
                                      InformationWidgetAboutBooking(firstText: 'Номер', secondText: state.data.room),
                                      InformationWidgetAboutBooking(firstText: 'Питание', secondText: state.data.nutrition),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 16),
                                        child: Text(
                                          'Информация о покупателе',
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      TextFieldWidget(
                                        text: '+7 (***) ***-**-**',
                                        input: [mask],
                                        textFieldKey: textFieldNumberKey,
                                        controller: _controllerNumber,
                                      ),
                                      const SizedBox(height: 8),
                                      TextFieldWidget(
                                        text: 'examplemail.000@mail.ru',
                                        textFieldKey: textFieldEmailKey,
                                        controller: _controllerEmail,
                                        validator: (input) => input?.isValidEmail() == true ? null : "Введите почту",
                                      ),
                                      const SizedBox(height: 8),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 16),
                                        child: Text(
                                          'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                                          style: TextStyle(
                                            color: Color(0xFF828796),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.data.tourists.length,
                                  itemBuilder: (context, index) {
                                    return TouristWidget(
                                      key: globalKeys[index],
                                      bookingBloc: BlocProvider.of<BookingBloc>(context),
                                      state: state,
                                      index: index,
                                      callback: (
                                        textFieldNameKey,
                                        textFieldLastNameKey,
                                        textFieldBirthdayKey,
                                        textFieldCitizenshipKey,
                                        textFieldPassportNumberKey,
                                        textValidityPeriodKey,
                                      ) {
                                        textFieldNameKey.currentState?.validate();
                                        textFieldLastNameKey.currentState?.validate();
                                        textFieldBirthdayKey.currentState?.validate();
                                        textFieldCitizenshipKey.currentState?.validate();
                                        textFieldPassportNumberKey.currentState?.validate();
                                        textValidityPeriodKey.currentState?.validate();
                                      },
                                      valueNotifier: valueNotifier,
                                    );
                                  },
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 16,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Добавить туриста',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      InkWell(
                                        child: Image.asset('assets/images/plus.png'),
                                        onTap: () {
                                          BlocProvider.of<BookingBloc>(context).add(AddTouristEvent());
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      PriceWidget(text: 'Тур', textPrice: '${state.data.tourPrice} ₽', color: colorBlack),
                                      PriceWidget(text: 'Топливный сбор', textPrice: '${state.data.fuelCharge} ₽', color: colorBlack),
                                      PriceWidget(text: 'Сервисный сбор', textPrice: '${state.data.serviceCharge} ₽', color: colorBlack),
                                      PriceWidget(
                                          text: 'К оплате',
                                          textPrice: '${state.data.tourPrice + state.data.fuelCharge + state.data.serviceCharge} ₽',
                                          color: colorBlue),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ButtonBookingWidget(
                          text: 'Оплатить ${state.data.tourPrice.toString().spaceSeparateNumbers()} ₽',
                          onPressed: () {
                            if (state.data.tourists.every((element) => element.isDataValid)) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const PaidScreen()));
                            } else {
                              textFieldNumberKey.currentState?.validate();
                              textFieldEmailKey.currentState?.validate();
                              valueNotifier.value = true;
                              valueNotifier.value = false;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
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
