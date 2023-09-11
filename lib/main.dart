import 'package:flutter/material.dart';
import 'package:hotel/presentation/screens/hotel/hotel.dart';

import 'di/injector.dart';

Future<void> main() async {
  await configureInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localizations Sample App',
     // localizationsDelegates: AppLocalizations.localizationsDelegates,
     // supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(primaryColor: Colors.amber),
      initialRoute: HotelScreen.routeName,
      routes: {
        HotelScreen.routeName: (context) =>  const HotelScreen(),
       // InformationAboutPokemonScreen.routeName :(context) => const InformationAboutPokemonScreen(),
      },
    );
  }
}
