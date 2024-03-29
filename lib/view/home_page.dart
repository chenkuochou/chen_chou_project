import 'package:chen_chou_project/common/constant/my_palette.dart';
import 'package:chen_chou_project/view/footer.dart';
import 'package:chen_chou_project/view/widget/section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int currentSection = {
      'Rustland': 0,
      'Mother Earth': 1,
      'whisper': 2,
      'Baseball': 3,
      'Footer': 4,
    }['Rustland']!;

    return Scaffold(
      backgroundColor: MyPalette.black,
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          controller: PageController(
            initialPage: currentSection,
          ),
          children: [
            const Section(),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.purple,
            ),
            Container(
              color: Colors.orange,
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
