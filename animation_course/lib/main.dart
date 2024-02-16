//import 'package:animation_course/page_route_builder_animation/splash_animation.dart';
import 'package:flutter/material.dart';

import 'custom_painter_example/bouncing_ball_animation.dart';

//import 'explicit_examples/loading_animation.dart';

//import 'implicit_examples/animated_color_pallete.dart';
//import 'implicit_examples/animated_shopping_cart_button.dart';
//import 'explicit_examples/list_animation.dart';
//import 'explicit_examples/login_animation.dart';
//import 'implicit_examples/animated_tween_animation_builder_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const RadialProgressAnimation(progress: 1.0, color: Colors.blue),
      home:const BouncingBallAnimation(),
    );
  }
}
