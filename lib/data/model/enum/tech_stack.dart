import 'package:chen_chou_project/common/constant/my_palette.dart';
import 'package:flutter/material.dart';

enum TechStack {
  firebase,
  firebaseAuth,
  fireStore,
  pixelDesign,
  svg,
  riverpod,
  googleFont,
  sharedPreferences,
  lottie,
  confetti,
  geolocator;

  String get displayName => switch (this) {
        TechStack.firebase => 'Firebase',
        TechStack.firebaseAuth => 'Firebase Auth',
        TechStack.fireStore => 'Firestore',
        TechStack.pixelDesign => 'Pixel Design',
        TechStack.svg => 'SVG',
        TechStack.riverpod => 'Riverpod',
        TechStack.googleFont => 'Google Font',
        TechStack.sharedPreferences => 'Shared Preferences',
        TechStack.lottie => 'Lottie',
        TechStack.confetti => 'Confetti',
        TechStack.geolocator => 'Geolocator',
      };

  Color get displayColor => switch (this) {
        TechStack.firebase => MyPalette.yellow,
        TechStack.firebaseAuth => MyPalette.yellow,
        TechStack.fireStore => MyPalette.yellow,
        TechStack.pixelDesign => MyPalette.blue,
        TechStack.svg => MyPalette.orange,
        TechStack.riverpod => MyPalette.blueDark,
        TechStack.googleFont => MyPalette.blueDark,
        TechStack.sharedPreferences => MyPalette.yellowDark,
        TechStack.lottie => MyPalette.blue,
        TechStack.confetti => MyPalette.pink,
        TechStack.geolocator => MyPalette.green,
        // _ => MyPalette.grey,
      };
}
