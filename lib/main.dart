import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_drum/screens/home.dart';
import 'package:flutter_drum/utils/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppAssets.preloadAssets();
  runApp(const FlutterDrum());
}

class FlutterDrum extends StatelessWidget {
  const FlutterDrum({super.key});

  @override
  Widget build(BuildContext context) {
  
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return ScreenUtilInit(
        designSize: const Size(1920, 1017),
        builder: (_,__) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Home(),
          );
        });
  }
}
