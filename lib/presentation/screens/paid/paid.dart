import 'dart:math';
import 'package:flutter/material.dart';

import '../hotel/hotel_screen.dart';


class PaidScreen extends StatelessWidget {
  const PaidScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var rng = Random();
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
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Заказ оплачен',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.15),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: Image.asset(
                          'assets/images/happy.png',
                          height: size.height * 0.15,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          'Ваш заказ принят в работу',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      //for (var i = 0; i < 10; i++)
                      Text(
                        'Подтверждение заказа №${rng.nextInt(100)} может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF828796),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 3,
                width: double.infinity,
                color: const Color(0xFFF6F6F9),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 12, bottom: 28, right: 15, left: 15),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HotelScreen()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Супер!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
