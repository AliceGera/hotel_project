import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F9),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        //controller: nameController,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            fontSize: 17,
            color: Color(0xFFA9ABB7),
          ),
          // hintText: 'Имя',
          labelText: text,
          labelStyle: const TextStyle(
            color: Color(0xFFA9ABB7),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}
