import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_drum/utils/app_assets.dart';
import 'package:simple_shadow/simple_shadow.dart';

class Snare extends StatefulWidget {
  const Snare({super.key});

  @override
  State<Snare> createState() => _SnareState();
}

class _SnareState extends State<Snare> {
  bool playSnare = false;
  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      sigma: 30,
      opacity: 1,
      offset: const Offset(0, 30),
      child: GestureDetector(
        onTap: () {
          AppAssets.pool.play(AppAssets.snareSoundId);
          setState(() {
            playSnare = true;
          });
        },
        child:Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image:  DecorationImage(
                  fit: BoxFit.cover,
                    image: AssetImage(
                  AppAssets.snare,
                ))),
          )
            .animate(
                onComplete: (_) => setState(() {
                      playSnare = false;
                    }),
                target: playSnare ? 1 : 0)
            .scaleXY(end: 1.1, duration: 0.03.seconds)
            .then(),
      ),
    );
  }
}
