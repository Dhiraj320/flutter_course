import 'package:flutter/material.dart';

class BouncingBallAnimation extends StatefulWidget {
  const BouncingBallAnimation({super.key});

  @override
  State<BouncingBallAnimation> createState() => _BouncingBallAnimationState();
}

class _BouncingBallAnimationState extends State<BouncingBallAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animationBall;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    animationBall = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(controller);

    controller.forward();

//addListener
    controller.addListener(() {
      if (animationBall.isCompleted) {
        controller.reverse();
      } else if (animationBall.isDismissed) {
        controller.forward();
      }
    });

    //or addListener vs addStatusListener both work as same
//addStatusListener
    // animationBall.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse();
    //   }else if (status == AnimationStatus.dismissed){
    //     controller.forward();

    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Need Ball
            AnimatedBuilder(
              animation: animationBall,
              builder: (context, child) => CustomPaint(
                size: const Size(200, 200),
                painter: BouncingBallPainter(animationBall.value),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BouncingBallPainter extends CustomPainter {
  final double animationValue;
  BouncingBallPainter(
    this.animationValue,
  );

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        Offset(size.width / 2, size.height - (size.height * animationValue)),
        20,
        Paint()..color = Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
