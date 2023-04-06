import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_drum/utils/app_assets.dart';
import 'package:simple_shadow/simple_shadow.dart';

class Kick extends StatefulWidget {
  const Kick({super.key});

  @override
  State<Kick> createState() => _KickState();
}

class _KickState extends State<Kick> {
  bool playKick = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          AppAssets.pool.play(AppAssets.kickSoundId);
          setState(() {
            playKick = true;
          });
        },
        child: SimpleShadow(
          sigma: 30,
          opacity: 1,
          offset: const Offset(0, 30),
          child: Image.asset(
            AppAssets.kick,
          )
              .animate(
                  onComplete: (_) => setState(() {
                        playKick = false;
                      }),
                  target: playKick ? 1 : 0)
              .scaleXY(end: 1.1, duration: 0.03.seconds)
              .then(),
        ));
  }
}
