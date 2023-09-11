import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HotelImagesWidget extends StatelessWidget {
  const HotelImagesWidget({
    Key? key,
    required this.hotelImages,
    required this.controller,
  }) : super(key: key);
  final List<String> hotelImages;
  final PageController controller ;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pages = List.generate(
      hotelImages.length,
          (index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 1),
        child: AspectRatio(
          aspectRatio: 343 / 257,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              hotelImages[index],
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 343 / 257,
          child: SizedBox(
            child: PageView.builder(
              controller: controller,
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
                  controller: controller,
                  count: hotelImages.length,
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
    );
  }
}
