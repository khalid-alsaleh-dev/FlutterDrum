import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_drum/utils/app_assets.dart';
import 'package:simple_shadow/simple_shadow.dart';

class Tom2 extends StatefulWidget {
  const Tom2({super.key});

  @override
  State<Tom2> createState() => _Tom2State();
}

class _Tom2State extends State<Tom2> {
  bool playTom2 = false;
  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      sigma: 30,
      opacity: 1,
      offset: const Offset(0, 30),
      child: GestureDetector(
        onTap: () {
          AppAssets.pool.play(AppAssets.tom2SoundId);
          setState(() {
            playTom2 = true;
          });
        },
        child:Container(
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
                      playTom2 = false;
                    }),
                target: playTom2 ? 1 : 0)
            .scaleXY(end: 1.1, duration: 0.03.seconds)
            .then(),
      ),
    );
  }
}
