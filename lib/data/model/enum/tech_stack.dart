import 'package:chen_chou_project/common/constant/my_palette.dart';
import 'package:flutter/material.dart';

enum TechStack {
  firebase('Firebase', MyPalette.yellow),
  firebaseAuth('Firebase Auth', MyPalette.yellowPure),
  fireStore('Firestore', MyPalette.yellowDark),
  pixelDesign('Pixel Design', MyPalette.blue),
  svg('SVG', MyPalette.yellowPure),
  riverpod('Riverpod', MyPalette.blueDark),
  googleFont('Google Font', MyPalette.orange),
  sharedPreferences('Shared Preferences', MyPalette.yellowDark),
  lottie('Lottie', MyPalette.blue),
  confetti('Confetti', MyPalette.pink),
  geolocator('Geolocator', MyPalette.green),
  appleSignIn('Apple Sign-in', MyPalette.grey),
  photoView('Photo View', MyPalette.bluePure),
  networkImage('Network Image', MyPalette.purple2);

  final String displayName;
  final Color displayColor;

  const TechStack(this.displayName, this.displayColor);
}
