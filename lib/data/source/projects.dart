import 'package:chen_chou_project/common/constant/my_palette.dart';
import 'package:chen_chou_project/data/data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<ProjectModel> projects = [
  /// Rustland
  ProjectModel(
    name: 'Rustland',
    subtitle: 'A Real-world Metaverse Game',
    imageMeta: const {'rustland': 4},
    type: ProjectType.proofOfConcept,
    description: '''
A groundbreaking pokemon-style metaverse game with blockchain built in Flutter!

Collecting a vast array of common and rare items hidden in real-world locations of your phone's GPS.

Crafting your collected items to create unique resources to construct stunning architects (which considered in-game economy allowing items to be traded and grow its value). Every creation is secured on the blockchain, ensuring true ownership.
''',
    techStack: const [
      TechStack.firebase,
      TechStack.firebaseAuth,
      TechStack.fireStore,
      TechStack.svg,
      TechStack.geolocator,
      TechStack.sharedPreferences,
      TechStack.appleSignIn,
      TechStack.pixelDesign,
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
Clicker for a Greener Future!

• Tap to choose solutions for real-world environmental
• Discover the impact of your choices
• Collect & gather resources
• Unlock and upgrade eco-friendly technologies
• Earn badges as you progress

Flutter "Global Gamers Challenge" competition
''',
    techStack: const [
      TechStack.confetti,
      TechStack.riverpod,
      TechStack.googleFont,
      TechStack.lottie,
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
    subtitle: 'Chat, flirt, and find meaningful connections hassle-free',
    imageMeta: const {'whisper': 7},
    type: ProjectType.proofOfConcept,
    description: '''
Whisper goes beyond swiping photos.  We connect you with people who share your passions!

• Nearby connections
• Hobby matching
• Career and occupational connection
• Start chats with customised questions
• Upload photos that capture your essence
• Grant friendship based on answers you like, 
  fostering genuine connections

Find your Spark. Find your friends. Find yourself.''',
    techStack: const [
      TechStack.firebase,
      TechStack.fireStore,
      TechStack.firebaseAuth,
      TechStack.geolocator,
      TechStack.networkImage,
      TechStack.googleFont,
      TechStack.photoView,
      TechStack.appleSignIn,
    ],
    textStyle: GoogleFonts.poppins(
        textStyle: const TextStyle(
      color: MyPalette.black,
    )),
    demoUrl: 'https://whisper-demo.netlify.app/',
    bgColor: MyPalette.greyWhite,
    credentials: const ['milesnext@gmail.com', '123456'],
  ),

  /// Baseball Classic
  ProjectModel(
    name: 'Baseball Tapped',
    subtitle: 'Unique players, unique abilities',
    imageMeta: const {'baseballClassic': 4},
    type: ProjectType.inProgress,
    description: '''
From rookies to legends, each player has a distinctive pixel avatar and special abilities that impact the game.

Players can choose strategies from:
• Contact for a base hit
• Go for glory with a power swing
• Play it safe with a bunt
• Wait for the perfect pitch

Experience the thrill of the diamond as the game simulates the battle between pitcher and batter, factoring in plate discipline, pitching and batting prowess, fielding plays, errors, and even runner speed!
''',
    techStack: const [
      TechStack.riverpod,
      TechStack.sharedPreferences,
      TechStack.svg,
      TechStack.networkImage,
      TechStack.googleFont,
      TechStack.pixelDesign,
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
