import 'package:flutter/material.dart';

class CustomAnimationController {
  late AnimationController _animationController;
  late Animation<double> _animation;

  void init(TickerProvider vsync) {
    _animationController = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();
  }

  void dispose() {
    _animationController.dispose();
  }

  Animation<double> get animation => _animation;

  void forward() {
    _animationController.forward();
  }

  void reverse() {
    _animationController.reverse();
  }
}
