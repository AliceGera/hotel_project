import 'package:flutter/material.dart';
import 'package:hotel/presentation/extension/string_extension.dart';

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
            textPrice.toString().spaceSeparateNumbers(),
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
