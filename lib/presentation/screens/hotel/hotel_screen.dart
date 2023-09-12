import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel/presentation/screens/hotel/widgets/basic_data_widget.dart';
import 'package:hotel/presentation/screens/hotel/widgets/button_widget.dart';
import 'package:hotel/presentation/screens/hotel/widgets/hotel_images.dart';
import 'package:hotel/presentation/screens/hotel/widgets/information_widget.dart';

import '../../../domain/interactor/hotel_interactor.dart';
import '../../widgets/load_more_indicator_widget.dart';
import 'bloc/hotel_bloc.dart';
import 'hotel_view_mapper.dart';

class HotelScreen extends StatefulWidget {
  static const routeName = '/hotel';

  const HotelScreen({Key? key}) : super(key: key);

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {

  List<String> text = [
    'Удобства',
    'Что включено',
    'Что не включено',
  ];
  List<String> icons = [
    'smile.svg',
    'check.svg',
    'close.svg',
  ];

  final controller = PageController(keepPage: true);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HotelBloc(
        GetIt.I.get<HotelInteractor>(),
        GetIt.I.get<HotelViewMapper>(),
      )..add(
          LoadHotelEvent(),
        ),
      child: BlocBuilder<HotelBloc, HotelState>(
        builder: (context, state) {
          if (state is HotelLoadingState || state is HotelInitialState) {
            return const CircularProgressIndicatorWidget();
          } else if (state is HotelFailedState) {
            return Container(
              child: Text('load'),
            );
          } else if (state is HotelSuccessState) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  centerTitle: true,
                  title: const Text(
                    'Отель',
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
                                  HotelImagesWidget(hotelImages: state.data.imageUrls, controller: controller),
                                  BasicDataWidget(
                                    rating: state.data.rating,
                                    ratingName: state.data.ratingName,
                                    name: state.data.name,
                                    adress: state.data.adress,
                                    minimalPrice: state.data.minimalPrice,
                                    priceForIt: state.data.priceForIt,
                                  ),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Об отеле',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Wrap(
                                    spacing: 8.0, // gap between adjacent chips
                                    runSpacing: 4.0, // gap between lines
                                    children: state.data.peculiarities
                                        .map(
                                          (e) => Chip(
                                            backgroundColor: const Color(0xFFFBFBFC),
                                            label: Text(
                                              e,
                                              style: const TextStyle(
                                                color: Color(0xFF828796),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  Text(
                                    state.data.description,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFFBFBFC),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                    child: Column(
                                      children: icons
                                          .asMap()
                                          .map(
                                            (index, e) => MapEntry(
                                              index,
                                              Column(
                                                children: [
                                                  InformationWidget(
                                                    icon: e,
                                                    text: text[index],
                                                      index:index,
                                                  ),
                                                  //const SizedBox(height: 10),
                                                ],
                                              ),
                                            ),
                                          )
                                          .values
                                          .toList(),
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
                    const ButtonWidget(text: "К выбору номера"),
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
