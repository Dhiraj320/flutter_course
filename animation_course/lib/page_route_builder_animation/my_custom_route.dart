import 'package:flutter/material.dart';

class MyCustomRouteTransition extends PageRouteBuilder {
  final Widget route;
  MyCustomRouteTransition({required this.route}) : 
  super( 
    pageBuilder: (context, animation, secondaryAnimation) {
            return route;
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
             //or for ScaleTransition  it required posttion
             // that want Animagte<Offset> for that we create tween here
            final tween = Tween(begin:const  Offset(0, -1), end: Offset.zero).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

            return SlideTransition(position: tween, child: child);
            //or for FadeTransition
            // return FadeTransition(
            //   opacity:animation , child: child);
          },
          reverseTransitionDuration: const Duration(milliseconds: 1000),
          transitionDuration: const Duration(milliseconds: 1000),
    );
}
