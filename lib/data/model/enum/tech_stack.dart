import 'package:chen_chou_project/common/constant/my_palette.dart';
import 'package:flutter/material.dart';

enum TechStack {
  firebase('Firebase', MyPalette.yellow),
  firebaseAuth('Firebase Auth', MyPalette.yellow),
  fireStore('Firestore', MyPalette.yellow),
  pixelDesign('Pixel Design', MyPalette.blue),
  svg('SVG', MyPalette.orange),
  riverpod('Riverpod', MyPalette.blueDark),
  googleFont('Google Font', MyPalette.blueDark),
  sharedPreferences('Shared Preferences', MyPalette.yellowDark),
  lottie('Lottie', MyPalette.blue),
  confetti('Confetti', MyPalette.pink),
  geolocator('Geolocator', MyPalette.green);

  final String displayName;
  final Color displayColor;

  const TechStack(this.displayName, this.displayColor);
}
