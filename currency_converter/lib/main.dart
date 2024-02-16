import 'package:currency_converter/pages/cureency_coverter_cupertino_page.dart';
import 'package:currency_converter/pages/currency_converter_mateial_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';

//import './pages/currency_converter_mateial_page.dart';// relative importing

void main() {
  runApp(const MyCupertinoApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CurrencyConverterMaterialPage());
  }
}

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: CurrencyConverterCupertinoPage());
  }
}
