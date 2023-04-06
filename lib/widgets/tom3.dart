import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_drum/utils/app_assets.dart';
import 'package:simple_shadow/simple_shadow.dart';

class Tom3 extends StatefulWidget {
  const Tom3({super.key});

  @override
  State<Tom3> createState() => _Tom3State();
}

class _Tom3State extends State<Tom3> {
  bool playTom3 = false;
  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateZ(pi / 6),
      child: SimpleShadow(
        sigma: 30,
        opacity: 1,
        offset: const Offset(0, 30),
        child: GestureDetector(
          onTap: () {
            AppAssets.pool.play(AppAssets.tom3SoundId);
            setState(() {
              playTom3 = true;
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
                        playTom3 = false;
                      }),
                  target: playTom3 ? 1 : 0)
              .scaleXY(end: 1.1, duration: 0.03.seconds)
              .then(),
        ),
      ),
    );
  }
}
