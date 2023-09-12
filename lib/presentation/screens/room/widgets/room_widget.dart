import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import '../../hotel/widgets/button_widget.dart';
import 'buttonChooseRoom.dart';

class RoomWidget extends StatelessWidget {
  const RoomWidget({
    Key? key,
    required this.name,
    required this.roomImages,
    required this.peculiarities,
    required this.price,
    required this.pricePer,
    required this.textButton,
  }) : super(key: key);
  final String name;
  final List<String> roomImages;
  final int price;
  final String pricePer;
  final List<String> peculiarities;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    final controllerRoom = PageController(keepPage: true);

    final size = MediaQuery.of(context).size;
    final pages = List.generate(
      roomImages.length,
      (index) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 1),
        child: AspectRatio(
          aspectRatio: 343 / 257,
          child: Image.network(
            roomImages[index],
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
    return Container(
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
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 343 / 257,
                child: SizedBox(
                  child: PageView.builder(
                    controller: controllerRoom,
                    allowImplicitScrolling: true,
                    itemBuilder: (_, index) {
                      return pages[index % pages.length];
                    },
                  ),
                ),
              ),
              Column(
                children: [
                  AspectRatio(
                    aspectRatio: 343 / 232,
                    child: Container(
                      width: double.infinity,
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: SmoothPageIndicator(
                        controller: controllerRoom,
                        count: 3,
                        effect: const WormEffect(
                          dotHeight: 7,
                          dotWidth: 7,
                          type: WormType.thinUnderground,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          ),
          Wrap(
            spacing: 8.0, // gap between adjacent chips
            runSpacing: 4.0, // gap between lines
            children: <Widget>[
              for (int i = 0; i < peculiarities.length; i++)
                Chip(
                  backgroundColor: Color(0xFFFBFBFC),
                  label: Text(
                    peculiarities[i],
                    style: const TextStyle(
                      color: Color(0xFF828796),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFF0D72FF).withOpacity(.1),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    'Подробнее о номере',
                    style: TextStyle(
                      color: Color(0xFF0D72FF),
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/blue_arrow.png',
                  height: 12,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    "$price ₽",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      height: 1,
                    ),
                  ),
                ),
                Text(
                  pricePer,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF828796),
                  ),
                ),
              ],
            ),
          ),
          ButtonChooseRoomWidget(text: textButton),
        ],
      ),
    );
  }
}
