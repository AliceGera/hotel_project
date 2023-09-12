import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    Key? key,
    required this.text,
    required this.textPrice,
    required this.color,
  }) : super(key: key);
  final String text;
  final String textPrice;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
             text,
            style: const TextStyle(
              color: Color(0xFF828796),
              fontSize: 16,
            ),
          ),
          Text(
            textPrice,
            style:  TextStyle(
              color: color,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
