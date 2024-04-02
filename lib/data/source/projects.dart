import 'package:chen_chou_project/common/constant/my_palette.dart';
import 'package:chen_chou_project/data/data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<ProjectModel> projects = [
  /// Rustland
  ProjectModel(
    name: 'Rustland',
    subtitle: 'A pokemon game with blockchain',
    imageMeta: const {'rustland': 4},
    type: ProjectType.proofOfConcept,
    description: '''
Random sentences can also spur creativity in other types of projects being done. If you are trying to come up with a new concept, a new idea or a new product, a random sentence may help you find unique qualities you may not have considered. 
''',
    techStack: const [
      TechStack.fireStore,
      TechStack.geolocator,
      TechStack.firebaseAuth,
      TechStack.geolocator,
      TechStack.geolocator,
    ],
    textStyle: GoogleFonts.poppins(
        textStyle: const TextStyle(
      color: MyPalette.grey,
    )),
    demoUrl: 'https://rustlanddemo.netlify.app/',
    bgColor: MyPalette.white,
  ),

  /// Mother Earth
  ProjectModel(
    name: 'Mother Earth',
    subtitle: 'A game that teaches you how to rescue our earth',
    imageMeta: const {'motherEarth': 9},
    type: ProjectType.production,
    description: '''
Random sentences can also spur creativity in other types of projects being done. If you are trying to come up with a new concept, a new idea or a new product, a random sentence may help you find unique qualities you may not have considered. 
''',
    techStack: const [
      TechStack.fireStore,
      TechStack.geolocator,
      TechStack.firebaseAuth,
      TechStack.geolocator,
      TechStack.geolocator,
    ],
    textStyle: GoogleFonts.ubuntuMono(
        textStyle: const TextStyle(
      color: MyPalette.greenDark,
    )),
    demoUrl: 'https://mother-earth-rescue.netlify.app',
    bgColor: MyPalette.whiteYellow,
  ),

  /// Whisper
  ProjectModel(
    name: 'Whisper',
    subtitle: 'A game that teaches you how to rescue our earth',
    imageMeta: const {'whisper': 7},
    type: ProjectType.proofOfConcept,
    description: '''
Random sentences can also spur creativity in other types of projects being done. If you are trying to come up with a new concept, a new idea or a new product, a random sentence may help you find unique qualities you may not have considered. 
''',
    techStack: const [
      TechStack.fireStore,
      TechStack.geolocator,
      TechStack.firebaseAuth,
      TechStack.geolocator,
      TechStack.geolocator,
    ],
    textStyle: GoogleFonts.poppins(
        textStyle: const TextStyle(
      color: MyPalette.black,
    )),
    demoUrl: 'https://mother-earth-rescue.netlify.app',
    bgColor: MyPalette.greyWhite,
  ),

  /// Baseball
  ProjectModel(
    name: 'Baseball Classic',
    subtitle: 'A game that teaches you how to rescue our earth',
    imageMeta: const {'baseballClassic': 4},
    type: ProjectType.inProgress,
    description: '''
Random sentences can also spur creativity in other types of projects being done. If you are trying to come up with a new concept, a new idea or a new product, a random sentence may help you find unique qualities you may not have considered. 
''',
    techStack: const [
      TechStack.fireStore,
      TechStack.geolocator,
      TechStack.firebaseAuth,
      TechStack.geolocator,
      TechStack.geolocator,
    ],
    textStyle: GoogleFonts.poppins(
        textStyle: const TextStyle(
      color: MyPalette.white,
    )),
    demoUrl:
        'https://apps.apple.com/us/app/baseball-player-classic/id6451048258',
    bgColor: MyPalette.black,
    isDarkTheme: true,
  ),
];
