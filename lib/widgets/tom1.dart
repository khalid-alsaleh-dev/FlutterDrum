import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_drum/utils/app_assets.dart';
import 'package:simple_shadow/simple_shadow.dart';

class Tom1 extends StatefulWidget {
  const Tom1({super.key});

  @override
  State<Tom1> createState() => _Tom1State();
}

class _Tom1State extends State<Tom1> {
  bool playTom1 = false;
  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateZ(-pi / 6),
      child: SimpleShadow(
        sigma: 30,
        opacity: 1,
        offset: const Offset(0, 30),
        child: GestureDetector(
          onTap: () {
            AppAssets.pool.play(AppAssets.tom1SoundId);
            setState(() {
              playTom1 = true;
            });
          },
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image:  DecorationImage(
                  fit: BoxFit.cover,
                    image: AssetImage(
                  AppAssets.tom,
                ))),
          )
              .animate(
                  onComplete: (_) => setState(() {
                        playTom1 = false;
                      }),
                  target: playTom1 ? 1 : 0)
              .scaleXY(end: 1.1, duration: 0.03.seconds)
              .then(),
        ),
      ),
    );
  }
}
