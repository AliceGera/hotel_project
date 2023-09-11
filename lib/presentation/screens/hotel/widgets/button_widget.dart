import 'package:flutter/material.dart';

import '../../room/room.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.text,

  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 12, bottom: 28),
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => const RoomScreen()));
        },
        child:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
