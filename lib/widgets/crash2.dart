import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_drum/utils/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_gradient/image_gradient.dart';
import 'package:simple_shadow/simple_shadow.dart';

class Crash2 extends StatefulWidget {
  const Crash2({super.key});

  @override
  State<Crash2> createState() => _Crash2State();
}

class _Crash2State extends State<Crash2> with TickerProviderStateMixin {
  late final AnimationController _crash2AnimationController;
  late final AnimationController _crash2ColorAnimationController;
  late final Animation _crash2Animation;
  late final Animation<Color?> _crash2FirstColorAnimation;
  late final Animation<Color?> _crash2SecondColorAnimation;

  @override
  void initState() {
    _crash2AnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _crash2ColorAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    _crash2Animation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.5), weight: 0.01),
      TweenSequenceItem(tween: Tween(begin: 1.5, end: -1.2), weight: 0.40),
      TweenSequenceItem(tween: Tween(begin: -1.2, end: 0.9), weight: 0.40),
      TweenSequenceItem(tween: Tween(begin: 0.9, end: -0.5), weight: 0.30),
      TweenSequenceItem(tween: Tween(begin: -0.5, end: 0.3), weight: 0.30),
      TweenSequenceItem(tween: Tween(begin: 0.3, end: -0.2), weight: 0.30),
      TweenSequenceItem(tween: Tween(begin: -0.2, end: 0.1), weight: 0.20),
      TweenSequenceItem(tween: Tween(begin: 0.1, end: 0), weight: 0.10),
    ]).animate(_crash2AnimationController);
    _crash2FirstColorAnimation = TweenSequence([
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
    ]).animate(_crash2ColorAnimationController);

    _crash2SecondColorAnimation = TweenSequence([
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
    ]).animate(_crash2ColorAnimationController);

    super.initState();
  }

  @override
  void dispose() {
    _crash2AnimationController.dispose();
    _crash2ColorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..rotateZ(pi / 8),
        child: AnimatedBuilder(
            animation: _crash2Animation,
            builder: (context, child) {
              return Center(
                child: GestureDetector(
                  onTap: () {
                    AppAssets.pool.play(AppAssets.crash2SoundId);
                    _crash2AnimationController.reset();
                    _crash2AnimationController.forward();
                    _crash2ColorAnimationController.reset();
                    _crash2ColorAnimationController.forward();
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
                            ..rotateX(
                                (-pi / 6.2) * _crash2Animation.value),
                          child: ImageGradient.sweep(
                              image: Image.asset(
                                AppAssets.crash,
                                width: 500,
                                height: 500,
                              ),
                              colors: [
                                _crash2FirstColorAnimation.value ?? Colors.grey,
                                _crash2SecondColorAnimation.value ?? Colors.white,
                                _crash2FirstColorAnimation.value ?? Colors.grey,
                                _crash2SecondColorAnimation.value ?? Colors.white,
                                _crash2FirstColorAnimation.value ?? Colors.grey,
                                _crash2SecondColorAnimation.value ?? Colors.white,
                                _crash2FirstColorAnimation.value ?? Colors.grey,
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
