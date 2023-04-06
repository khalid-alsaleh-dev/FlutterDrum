import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';


class AppAssets {
  static const closeHH = 'assets/images/close_hh.png';
  static const crash = 'assets/images/crash.png';
  static const floor = 'assets/images/floor.png';
  static const kick = 'assets/images/kick.png';
  static const openHH = 'assets/images/open_hh.png';
  static const ride = 'assets/images/ride.png';
  static const snare = 'assets/images/snare.png';
  static const splash = 'assets/images/splash.png';
  static const tom = 'assets/images/tom.png';
  static const screw = 'assets/images/screw.png';

  static const _closedHiHatSound = 'assets/sound_effects/closed_hi_hat.mp3';
  static const _crash1Sound = 'assets/sound_effects/crash1.mp3';
  static const _crash2Sound = 'assets/sound_effects/crash2.mp3';
  static const _floorSound = 'assets/sound_effects/floor.mp3';
  static const _hiHatOpenSound = 'assets/sound_effects/hi_hat_open.mp3';
  static const _kickSound = 'assets/sound_effects/kick.wav';
  static const _rideSound = 'assets/sound_effects/ride.mp3';
  static const _snareSound = 'assets/sound_effects/snare.mp3';
  static const _splashSound = 'assets/sound_effects/splash.mp3';
  static const _tom1Sound = 'assets/sound_effects/tom1.mp3';
  static const _tom2Sound = 'assets/sound_effects/tom2.mp3';
  static const _tom3Sound = 'assets/sound_effects/tom3.mp3';
  
  static late final int closedHiHatSoundId;
  static late final int crash1SoundId;
  static late final int crash2SoundId;
  static late final int floorSoundId;
  static late final int hiHatOpenSoundId;
  static late final int kickSoundId;
  static late final int rideSoundId;
  static late final int snareSoundId;
  static late final int splashSoundId;
  static late final int tom1SoundId;
  static late final int tom2SoundId;
  static late final int tom3SoundId;

  static late final Soundpool pool;

  
  static Future<void> preloadAssets() async {
    await _preloadAudioAssets();
  }

  static Future<void> _preloadAudioAssets() async {
    pool = Soundpool.fromOptions(
        options: const SoundpoolOptions(
      streamType: StreamType.music,
          maxStreams: 5
    ));
 
    closedHiHatSoundId =
        await rootBundle.load(_closedHiHatSound).then((ByteData soundData) {
      return pool.load(soundData);
    });
    crash1SoundId =
        await rootBundle.load(_crash1Sound).then((ByteData soundData) {
      return pool.load(soundData);
    });
    crash2SoundId =
        await rootBundle.load(_crash2Sound).then((ByteData soundData) {
      return pool.load(soundData);
    });
    floorSoundId =
        await rootBundle.load(_floorSound).then((ByteData soundData) {
      return pool.load(soundData);
    });
    hiHatOpenSoundId =
        await rootBundle.load(_hiHatOpenSound).then((ByteData soundData) {
      return pool.load(soundData);
    });
    kickSoundId =
        await rootBundle.load(_kickSound).then((ByteData soundData) {
      return pool.load(soundData);
    });
    rideSoundId =
        await rootBundle.load(_rideSound).then((ByteData soundData) {
      return pool.load(soundData);
    });


     snareSoundId =
        await rootBundle.load(_snareSound).then((ByteData soundData) {
      return pool.load(soundData);
    });


     splashSoundId =
        await rootBundle.load(_splashSound).then((ByteData soundData) {
      return pool.load(soundData);
    });
     tom1SoundId =
        await rootBundle.load(_tom1Sound).then((ByteData soundData) {
      return pool.load(soundData);
    });
      tom2SoundId =
        await rootBundle.load(_tom2Sound).then((ByteData soundData) {
      return pool.load(soundData);
    });
      tom3SoundId =
        await rootBundle.load(_tom3Sound).then((ByteData soundData) {
      return pool.load(soundData);
    });
  }

  
}
