import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel/presentation/extension/string_extension.dart';

class BasicDataWidget extends StatelessWidget {
  const BasicDataWidget({
    Key? key,
    required this.rating,
    required this.ratingName,
    required this.name,
    required this.adress,
    required this.minimalPrice,
    required this.priceForIt,
  }) : super(key: key);
  final int rating;
  final String ratingName;
  final String name;
  final String adress;
  final int minimalPrice;
  final String priceForIt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
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
                    '$rating $ratingName',
                    style: const TextStyle(
                      color: Color(0xFFFFA800),
                    ),
                  ),
                ],
              ),
            )),
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          child: Text(
            adress,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xFF0D72FF),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'от ${minimalPrice.toString().spaceSeparateNumbers()} ₽',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
            Text(
              priceForIt,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF828796),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
