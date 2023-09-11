import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InformationWidget extends StatelessWidget {
  const InformationWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  //final List<String> hotelImages;
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SvgPicture.asset('assets/images/$icon'),
          Container(
            padding: const EdgeInsets.only(left: 12),
            width: size.width * .75,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          'Самое необходимое',
                          style: TextStyle(
                            color: Color(0xFF828796),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/arrow.png',
                      height: 15,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 1,
                    color: const Color(0xFF828796).withOpacity(.15),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
