import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_drum/utils/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_gradient/image_gradient.dart';
import 'package:simple_shadow/simple_shadow.dart';

class OpenHiHat extends StatefulWidget {
  const OpenHiHat({super.key});

  @override
  State<OpenHiHat> createState() => _OpenHiHatState();
}

class _OpenHiHatState extends State<OpenHiHat> with TickerProviderStateMixin {
  late final AnimationController _openHHController;
  late final AnimationController _openHHColorAnimationController;
  late final Animation _openHHAnimation;
  late final Animation<Color?> _openHHFirstColorAnimation;
  late final Animation<Color?> _openHHSecondColorAnimation;

  @override
  void initState() {
    _openHHController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _openHHColorAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _openHHAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.5), weight: 0.01),
      TweenSequenceItem(tween: Tween(begin: 1.5, end: -1.2), weight: 0.40),
      TweenSequenceItem(tween: Tween(begin: -1.2, end: 0.9), weight: 0.40),
      TweenSequenceItem(tween: Tween(begin: 0.9, end: -0.5), weight: 0.30),
      TweenSequenceItem(tween: Tween(begin: -0.5, end: 0.3), weight: 0.30),
      TweenSequenceItem(tween: Tween(begin: 0.3, end: -0.2), weight: 0.30),
      TweenSequenceItem(tween: Tween(begin: -0.2, end: 0.1), weight: 0.20),
      TweenSequenceItem(tween: Tween(begin: 0.1, end: 0), weight: 0.10),
    ]).animate(_openHHController);

    _openHHFirstColorAnimation = TweenSequence([
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
    ]).animate(_openHHColorAnimationController);

    _openHHSecondColorAnimation = TweenSequence([
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
    ]).animate(_openHHColorAnimationController);

    super.initState();
  }

  @override
  void dispose() {
    _openHHController.dispose();
    _openHHColorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..rotateZ(-pi / 4.5),
        child: AnimatedBuilder(
            animation: _openHHAnimation,
            builder: (context, child) {
              return Center(
                child: GestureDetector(
                  onTap: () {
                    AppAssets.pool.play(AppAssets.hiHatOpenSoundId);
                    _openHHController.reset();
                    _openHHController.forward();
                    _openHHColorAnimationController.reset();
                    _openHHColorAnimationController.forward();
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
                            ..rotateX((-pi / 7) * _openHHAnimation.value),
                          child: ImageGradient.sweep(
                              image: Image.asset(
                                AppAssets.openHH,
                              ),
                              colors: [
                                _openHHFirstColorAnimation.value ?? Colors.grey,
                                _openHHSecondColorAnimation.value ?? Colors.white,
                                _openHHFirstColorAnimation.value ?? Colors.grey,
                                _openHHSecondColorAnimation.value ?? Colors.white,
                                _openHHFirstColorAnimation.value ?? Colors.grey,
                                _openHHSecondColorAnimation.value ?? Colors.white,
                                _openHHFirstColorAnimation.value ?? Colors.grey,
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
