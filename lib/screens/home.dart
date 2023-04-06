import 'package:flutter/material.dart';
import 'package:flutter_drum/utils/app_colors.dart';
import 'package:flutter_drum/widgets/close_hi_hat.dart';
import 'package:flutter_drum/widgets/crash1.dart';
import 'package:flutter_drum/widgets/crash2.dart';
import 'package:flutter_drum/widgets/floor.dart';
import 'package:flutter_drum/widgets/kick.dart';
import 'package:flutter_drum/widgets/open_hi_hat.dart';
import 'package:flutter_drum/widgets/ride.dart';
import 'package:flutter_drum/widgets/snare.dart';
import 'package:flutter_drum/widgets/splash.dart';
import 'package:flutter_drum/widgets/tom1.dart';
import 'package:flutter_drum/widgets/tom2.dart';
import 'package:flutter_drum/widgets/tom3.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
          backgroundColor: AppColors.darkBackground,
          body: Center(
            child: AspectRatio(
              aspectRatio: 2,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                      bottom: 10.w,
                      left: 10.w,
                      child: SizedBox(
                          width: 400.w,
                          height: 400.w,
                          child: const OpenHiHat())),
                  Positioned(
                      bottom: 200.w,
                      left: 70.w,
                      child: SizedBox(
                          width: 400.w,
                          height: 400.w,
                          child: const CloseHiHat())),
                  Positioned(
                      bottom: 0.w,
                      right: 10.w,
                      child: SizedBox(
                          width: 450.w, height: 450.w, child: const Floor())),
                  Positioned(
                      bottom: 0.w,
                      right: 450.w,
                      child: SizedBox(
                          width: 500.w, height: 350.w, child: const Kick())),
                  Positioned(
                      bottom: 0.w,
                      left: 450.w,
                      child: SizedBox(
                          width: 500.w, height: 350.w, child: const Kick())),
                  Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: 200.0.w),
                    child: SizedBox(
                        width: 380.w, height: 380.w, child: const Snare()),
                  )),
                  Positioned(
                      top: 270.w,
                      left: 500.w,
                      child: SizedBox(
                          width: 350.w, height: 350.w, child: const Tom1())),
                  Positioned(
                      top: 270.w,
                      right: 500.w,
                      child: SizedBox(
                          width: 350.w, height: 350.w, child: const Tom3())),
                  Padding(
                    padding: EdgeInsets.only(top: 100.0.w),
                    child: SizedBox(
                        width: 350.w, height: 350.w, child: const Tom2()),
                  ),
                  Positioned(
                      top: 10.w,
                      left: 150.w,
                      child: SizedBox(
                          width: 500.w, height: 500.w, child: const Crash1())),
                  Positioned(
                      top: 30.w,
                      left: 560.w,
                      child: SizedBox(
                          width: 300.w, height: 300.w, child: const Splash())),
                  Positioned(
                      top: 10.w,
                      right: 10.w,
                      child: SizedBox(
                          width: 600.w, height: 600.w, child: const Ride())),
                  Positioned(
                      top: 30.w,
                      right: 550.w,
                      child: SizedBox(
                          width: 300.w, height: 300.w, child: const Crash2())),
                ],
              ),
            ),
          )),
    );
  }
}
