import 'package:flutter/material.dart';
import 'package:travel_app_paralax_effect_flutter/constants.dart';
import 'package:travel_app_paralax_effect_flutter/screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App UI',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Montserrat', ),
      ),
      home: const HomeScreen(),
    );
  }
}
