import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel/presentation/screens/room/room_view_mapper.dart';
import 'package:hotel/presentation/screens/room/widgets/room_widget.dart';
import '../../../domain/interactor/room_interactor.dart';
import 'bloc/room_bloc.dart';
import 'bloc/room_state.dart';
import 'bloc/room_event.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({Key? key}) : super(key: key);

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  List<String> roomImages = [
    'room.png',
    'room.png',
    'room.png',
  ];
  List<String> peculiarities = [
    'Включен только завтрак',
    'Кондиционер',
  ];
  String name = 'Стандартный номер с видом на бассейн';
  int price = 186600;
  String pricePer = 'За 7 ночей с перелетом';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return BlocProvider(
      create: (context) =>
      RoomBloc(
        GetIt.I.get<RoomInteractor>(),
        GetIt.I.get<RoomViewMapper>(),
      )
        ..add(
          LoadRoomEvent(),
        ),
      child: BlocBuilder<RoomBloc, RoomState>(
        builder: (context, state) {
          if (state is RoomLoadingState || state is RoomInitialState) {
            return Container(
              child: Text('load'),
            );
          } else if (state is RoomFailedState) {
            return Container(
              child: Text('load'),
            );
          } else if (state is RoomSuccessState) {
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
                    'Steigenberger Makadi',
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
                        child:
                        ListView.builder(
                            itemCount: state.data.listRoomScreenData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  SizedBox(height: size.height * .01),
                                  RoomWidget(
                                    name: state.data.listRoomScreenData[index].name,
                                    roomImages: state.data.listRoomScreenData[index].imageUrls,
                                    peculiarities: state.data.listRoomScreenData[index].peculiarities,
                                    price: state.data.listRoomScreenData[index].price,
                                    pricePer: state.data.listRoomScreenData[index].pricePer,
                                    textButton: 'Выбрать номер',
                                  ),
                                  SizedBox(height: size.height * .01),
                                ],
                              );
                                  }),
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