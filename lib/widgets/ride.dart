import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_drum/utils/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_gradient/image_gradient.dart';
import 'package:simple_shadow/simple_shadow.dart';

class Ride extends StatefulWidget {
  const Ride({super.key});

  @override
  State<Ride> createState() => _RideState();
}

class _RideState extends State<Ride> with TickerProviderStateMixin {
  late final AnimationController _rideController;
  late final AnimationController _rideColorAnimationController;
  late final Animation _rideAnimation;
  late final Animation<Color?> _rideFirstColorAnimation;
  late final Animation<Color?> _rideSecondColorAnimation;

  @override
  void initState() {
    _rideController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _rideColorAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _rideAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.5), weight: 0.01),
      TweenSequenceItem(tween: Tween(begin: 1.5, end: -1.2), weight: 0.40),
      TweenSequenceItem(tween: Tween(begin: -1.2, end: 0.9), weight: 0.40),
      TweenSequenceItem(tween: Tween(begin: 0.9, end: -0.5), weight: 0.30),
      TweenSequenceItem(tween: Tween(begin: -0.5, end: 0.3), weight: 0.30),
      TweenSequenceItem(tween: Tween(begin: 0.3, end: -0.2), weight: 0.30),
      TweenSequenceItem(tween: Tween(begin: -0.2, end: 0.1), weight: 0.20),
      TweenSequenceItem(tween: Tween(begin: 0.1, end: 0), weight: 0.10),
    ]).animate(_rideController);

      _rideFirstColorAnimation = TweenSequence([
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
    ]).animate(_rideColorAnimationController);

    _rideSecondColorAnimation = TweenSequence([
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
    ]).animate(_rideColorAnimationController);
    super.initState();
  }

  @override
  void dispose() {
    _rideController.dispose();
    _rideColorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..rotateZ(pi / 4.5),
        child: AnimatedBuilder(
            animation: _rideAnimation,
            builder: (context, child) {
              return Center(
                child: GestureDetector(
                  onTap: () {
                    AppAssets.pool.play(AppAssets.rideSoundId);
                    _rideController.reset();
                    _rideController.forward();
                    _rideColorAnimationController.reset();
                    _rideColorAnimationController.forward();
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
                            ..rotateX((-pi / 9) * _rideAnimation.value),
                          child: ImageGradient.sweep(
                              image: Image.asset(
                                AppAssets.ride,
                              ),
                              colors:  [
                                _rideFirstColorAnimation.value ?? Colors.grey,
                                _rideSecondColorAnimation.value ?? Colors.white,
                                _rideFirstColorAnimation.value ?? Colors.grey,
                                _rideSecondColorAnimation.value ?? Colors.white,
                                _rideFirstColorAnimation.value ?? Colors.grey,
                                _rideSecondColorAnimation.value ?? Colors.white,
                                _rideFirstColorAnimation.value ?? Colors.grey,
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
