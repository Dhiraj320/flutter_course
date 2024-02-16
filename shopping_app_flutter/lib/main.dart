import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/cart_provider.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: "Shopping App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSeed(
                primary: const Color.fromRGBO(254, 206, 1, 1),
                seedColor: const Color.fromRGBO(254, 206, 1, 1)),
            inputDecorationTheme: const InputDecorationTheme(
              prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
              hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            textTheme: const TextTheme(
                titleLarge:
                    TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                titleMedium: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                bodySmall:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            ),
            useMaterial3: true),
        home: const HomePage(),
      ),
    );
  }
}
