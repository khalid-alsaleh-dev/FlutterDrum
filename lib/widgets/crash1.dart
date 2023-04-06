import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_drum/utils/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_gradient/image_gradient.dart';
import 'package:simple_shadow/simple_shadow.dart';

class Crash1 extends StatefulWidget {
  const Crash1({super.key});

  @override
  State<Crash1> createState() => _Crash1State();
}

class _Crash1State extends State<Crash1> with TickerProviderStateMixin {
  late final AnimationController _crash1AnimationController;
  late final AnimationController _crash1ColorAnimationController;
  late final Animation _crash1Animation;
  late final Animation<Color?> _crash1FirstColorAnimation;
  late final Animation<Color?> _crash1SecondColorAnimation;

  @override
  void initState() {
    _crash1AnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _crash1ColorAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    _crash1Animation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.5), weight: 0.01),
      TweenSequenceItem(tween: Tween(begin: 1.5, end: -1.2), weight: 0.40),
      TweenSequenceItem(tween: Tween(begin: -1.2, end: 0.9), weight: 0.40),
      TweenSequenceItem(tween: Tween(begin: 0.9, end: -0.5), weight: 0.30),
      TweenSequenceItem(tween: Tween(begin: -0.5, end: 0.3), weight: 0.30),
      TweenSequenceItem(tween: Tween(begin: 0.3, end: -0.2), weight: 0.30),
      TweenSequenceItem(tween: Tween(begin: -0.2, end: 0.1), weight: 0.20),
      TweenSequenceItem(tween: Tween(begin: 0.1, end: 0), weight: 0.10),
    ]).animate(_crash1AnimationController);

    _crash1FirstColorAnimation = TweenSequence([
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
    ]).animate(_crash1ColorAnimationController);

    _crash1SecondColorAnimation = TweenSequence([
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
    ]).animate(_crash1ColorAnimationController);
    super.initState();
  }

  @override
  void dispose() {
    _crash1AnimationController.dispose();
    _crash1ColorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..rotateZ(-pi / 6),
        child: AnimatedBuilder(
            animation: _crash1Animation,
            builder: (context, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  SimpleShadow(
                    sigma: 30,
                    opacity: 1,
                    offset: const Offset(0, 30),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..rotateX((-pi / 6.2) * _crash1Animation.value),
                      child: GestureDetector(
                        onTap: () {
                          AppAssets.pool.play(AppAssets.crash1SoundId);
                          _crash1AnimationController.reset();
                          _crash1AnimationController.forward();
                          _crash1ColorAnimationController.reset();
                          _crash1ColorAnimationController.forward();
                        },
                        child: ImageGradient.sweep(
                            image: Image.asset(
                              AppAssets.crash,
                            ),
                            colors: [
                              _crash1FirstColorAnimation.value ?? Colors.grey,
                              _crash1SecondColorAnimation.value ?? Colors.white,
                              _crash1FirstColorAnimation.value ?? Colors.grey,
                              _crash1SecondColorAnimation.value ?? Colors.white,
                              _crash1FirstColorAnimation.value ?? Colors.grey,
                              _crash1SecondColorAnimation.value ?? Colors.white,
                              _crash1FirstColorAnimation.value ?? Colors.grey,
                            ]),
                      ),
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
              );
            }));
  }
}
