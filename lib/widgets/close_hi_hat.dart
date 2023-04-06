import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_drum/utils/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_gradient/image_gradient.dart';
import 'package:simple_shadow/simple_shadow.dart';

class CloseHiHat extends StatefulWidget {
  const CloseHiHat({super.key});

  @override
  State<CloseHiHat> createState() => _CloseHiHatState();
}

class _CloseHiHatState extends State<CloseHiHat>
    with TickerProviderStateMixin {
  late final AnimationController _closeHHAnimationController;
  late final AnimationController _closeHHColorAnimationController;
  late final Animation<Color?> _closeHHFirstColorAnimation;
  late final Animation<Color?> _closeHHSecondColorAnimation;
  late final Animation _closeHHAnimation;

  @override
  void initState() {
    _closeHHAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    _closeHHColorAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));


    _closeHHAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.5), weight: 0.4),
      TweenSequenceItem(tween: Tween(begin: 1.5, end: 0), weight: 0.4),
    ]).animate(_closeHHAnimationController);
     _closeHHFirstColorAnimation = TweenSequence([
      TweenSequenceItem(tween: ColorTween(begin: Colors.grey,end: Colors.white), weight: 0.4),
     TweenSequenceItem(tween: ColorTween(begin: Colors.white,end: Colors.grey), weight: 0.4),
    ]).animate(_closeHHColorAnimationController);
  _closeHHSecondColorAnimation = TweenSequence([
      TweenSequenceItem(tween: ColorTween(begin: Colors.white,end: Colors.grey), weight: 0.4),
     TweenSequenceItem(tween: ColorTween(begin: Colors.grey,end: Colors.white), weight: 0.4),
    ]).animate(_closeHHColorAnimationController);

    super.initState();
  }

  @override
  void dispose() {
    _closeHHAnimationController.dispose();
    _closeHHColorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..rotateZ(-pi / 4.5),
          child: AnimatedBuilder(
              animation: _closeHHAnimation,
              builder: (context, child) {
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      AppAssets.pool.play(AppAssets.closedHiHatSoundId);
                      _closeHHAnimationController.reset();
                      _closeHHAnimationController.forward();
                      _closeHHColorAnimationController.reset();
                      _closeHHColorAnimationController.forward();
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
                              ..rotateX((-pi / 7) * _closeHHAnimation.value),
                            child: ImageGradient.sweep(
                                image: Image.asset(
                                  AppAssets.closeHH,
                                ),
                                colors:  [
                                _closeHHFirstColorAnimation.value ?? Colors.grey,
                              _closeHHSecondColorAnimation.value ?? Colors.white,
                                _closeHHFirstColorAnimation.value ?? Colors.grey,
                              _closeHHSecondColorAnimation.value ?? Colors.white,
                               _closeHHFirstColorAnimation.value ?? Colors.grey,
                              _closeHHSecondColorAnimation.value ?? Colors.white,
                                  _closeHHFirstColorAnimation.value ?? Colors.grey,
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
              })),
    );
  }
}
