import 'package:events_poster/ui/constants.dart';
import 'package:flutter/material.dart';

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    Tween<double> radiusTween = Tween(begin: 10.0, end: 20.0);

    animation = radiusTween.animate(animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, snapshot) {
          return CustomPaint(
            painter: LoadingPainter(15.0, animation.value),
          );
        },
      ),
    );
  }
}

class LoadingPainter extends CustomPainter {
  final double radius;
  final double animationRadius;

  LoadingPainter(this.radius, this.animationRadius);
  @override
  void paint(Canvas canvas, Size size) {
    _paintCircle1(canvas, size);
    _paintCircle2(canvas, size);
  }

  void _paintCircle1(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    var paint = Paint()..color = kMediumPurpleColor;
    canvas.drawCircle(center, radius, paint);
  }

  void _paintCircle2(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    var paint = Paint()..color = kVeryLightPurpleColor;
    canvas.drawCircle(center, radius + animationRadius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
