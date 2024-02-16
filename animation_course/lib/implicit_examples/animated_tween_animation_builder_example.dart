import 'package:flutter/material.dart';

class PulsatingCircleAnimation extends StatelessWidget {
  const PulsatingCircleAnimation({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pulsating Circle Animation'),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end:200),
          // 0 and 200 is int but we want it to treat as double so we use <double> 
          duration: const Duration(milliseconds: 1500),
          
          builder: (context, size, widget) {
            return Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    blurRadius: size,
                    spreadRadius: size / 2,
                  ),
                ],
              ),
              // if we pass child of Container it does work with animation
              //child: const Text("hello"),
              // so we pass it here child of tweenanimationbulder
              child: widget,
            ); 
          },
          // here the widget of tween animation builder work with animation
          child: const Text("Hello"),
         
        ),
      ),
    );
  }
}
