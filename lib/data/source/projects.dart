import 'package:chen_chou_project/common/constant/my_palette.dart';
import 'package:chen_chou_project/data/model/enum/project_type.dart';
import 'package:chen_chou_project/data/model/enum/tech_stack.dart';
import 'package:chen_chou_project/data/model/project_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<ProjectModel> projects = [
  ProjectModel(
    name: 'Rustland',
    subtitle: 'A pokemon game with blockchain',
    imageNames: const ['rustland1', 'sample'],
    type: ProjectType.proofOfConcept,
    description: '''
Random sentences can also spur creativity in other types of projects being done. If you are trying to come up with a new concept, a new idea or a new product, a random sentence may help you find unique qualities you may not have considered. 
Trying to incorporate the sentence into your project can help you look at it in different and unexpected ways than you would normally on your own.
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
      ),
    ),
    demoUrl: '',
  ),
];
