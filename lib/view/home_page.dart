import 'package:chen_chou_project/common/constant/my_palette.dart';
import 'package:chen_chou_project/data/source/projects.dart';
import 'package:chen_chou_project/view/footer.dart';
import 'package:chen_chou_project/view/widget/section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int currentSection = {
      'Rustland': 0,
      'MotherEarth': 1,
      'Whisper': 2,
      'Baseball': 3,
      'Footer': 4,
    }['Whisper']!;

    return Scaffold(
      backgroundColor: MyPalette.black,
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          controller: PageController(
            initialPage: currentSection,
          ),
          children: [
            for (int i = 0; i < projects.length; i++)
              Section(projects[i]),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
