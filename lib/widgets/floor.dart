import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_drum/utils/app_assets.dart';
import 'package:simple_shadow/simple_shadow.dart';

class Floor extends StatefulWidget {
  const Floor({super.key});

  @override
  State<Floor> createState() => _FloorState();
}

class _FloorState extends State<Floor> {
  bool playFloor = false;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
          onTap: () {
            AppAssets.pool.play(AppAssets.floorSoundId);
            setState(() {
              playFloor = true;
            });
          },
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateZ(pi / 6),
            child: SimpleShadow(
              sigma: 30,
              opacity: 1,
              offset: const Offset(0, 30),
              child: Image.asset(
                AppAssets.floor,
              )
                  .animate(
                      onComplete: (_) => setState(() {
                            playFloor = false;
                          }),
                      target: playFloor ? 1 : 0)
                  .scaleXY(end: 1.1, duration: 0.03.seconds)
                  .then(),
            ),
          )),
    );
  }
}
