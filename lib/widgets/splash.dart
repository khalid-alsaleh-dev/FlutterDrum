import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_drum/utils/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_gradient/image_gradient.dart';
import 'package:simple_shadow/simple_shadow.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late final AnimationController _splashController;
  late final AnimationController _splashColorAnimationController;
  late final Animation _splashAnimation;
  late final Animation<Color?> _splashFirstColorAnimation;
  late final Animation<Color?> _splashSecondColorAnimation;

  @override
  void initState() {
    _splashController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _splashColorAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _splashAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.5), weight: 0.01),
      TweenSequenceItem(tween: Tween(begin: 1.5, end: -1.2), weight: 0.40),
      TweenSequenceItem(tween: Tween(begin: -1.2, end: 0.9), weight: 0.40),
      TweenSequenceItem(tween: Tween(begin: 0.9, end: -0.5), weight: 0.30),
      TweenSequenceItem(tween: Tween(begin: -0.5, end: 0.3), weight: 0.30),
      TweenSequenceItem(tween: Tween(begin: 0.3, end: -0.2), weight: 0.30),
      TweenSequenceItem(tween: Tween(begin: -0.2, end: 0.1), weight: 0.20),
      TweenSequenceItem(tween: Tween(begin: 0.1, end: 0), weight: 0.10),
    ]).animate(_splashController);

    _splashFirstColorAnimation = TweenSequence([
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.white, end: Colors.grey),
          weight: 0.01),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.grey, end: Colors.white),
          weight: 0.40),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.white, end: Colors.grey),
          weight: 0.40),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.grey, end: Colors.white),
          weight: 0.30),
    ]).animate(_splashColorAnimationController);

    _splashSecondColorAnimation = TweenSequence([
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.grey, end: Colors.white),
          weight: 0.01),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.white, end: Colors.grey),
          weight: 0.40),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.grey, end: Colors.white),
          weight: 0.40),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.white, end: Colors.grey),
          weight: 0.30),
    ]).animate(_splashColorAnimationController);

    super.initState();
  }

  @override
  void dispose() {
    _splashController.dispose();
    _splashColorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..rotateZ(-pi / 8),
        child: AnimatedBuilder(
            animation: _splashAnimation,
            builder: (context, child) {
              return Center(
                child: GestureDetector(
                  onTap: () {
                    AppAssets.pool.play(AppAssets.splashSoundId);
                    _splashController.reset();
                    _splashController.forward();
                    _splashColorAnimationController.reset();
                    _splashColorAnimationController.forward();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SimpleShadow(
                        sigma: 30,
                        opacity: 1,
                        offset: const Offset(0, 30),
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..rotateX((-pi / 7) * _splashAnimation.value),
                          child: ImageGradient.sweep(
                              image: Image.asset(
                                AppAssets.splash,
                                width: 500,
                                height: 500,
                              ),
                              colors: [
                                _splashFirstColorAnimation.value ?? Colors.grey,
                                _splashSecondColorAnimation.value ?? Colors.white,
                                _splashFirstColorAnimation.value ?? Colors.grey,
                                _splashSecondColorAnimation.value ?? Colors.white,
                                _splashFirstColorAnimation.value ?? Colors.grey,
                                _splashSecondColorAnimation.value ?? Colors.white,
                                _splashFirstColorAnimation.value ?? Colors.grey,
                              ]),
                        ),
                      ),
                  Container(
                    width: 50.w,
                    height: 50.w,
                    decoration:  const BoxDecoration(
                       shape: BoxShape.circle),
                       child: Image.asset(AppAssets.screw),
                  ),
                    ],
                  ),
                ),
              );
            }));
  }
}
