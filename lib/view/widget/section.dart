import 'package:carousel_slider/carousel_slider.dart';
import 'package:chen_chou_project/common/constant/my_palette.dart';
import 'package:chen_chou_project/common/widget/my_text.dart';
import 'package:chen_chou_project/data/model/enum/project_type.dart';
import 'package:chen_chou_project/data/model/enum/tech_stack.dart';
import 'package:chen_chou_project/data/model/project_model.dart';
import 'package:chen_chou_project/data/source/projects.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Section extends StatefulWidget {
  const Section({super.key});

  @override
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> {
  late CarouselController controller;
  int currentIndex = 0;

  @override
  void initState() {
    controller = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const bool isImgLeft = true;
    const Color bgColor = MyPalette.white;
    final ProjectModel projectModel = projects[0];

    final String title = projectModel.name;
    final List<String> images =
        projectModel.imageNames.map((e) => 'assets/img/$e.png').toList();
    final String subtitle = projectModel.subtitle;
    final String description = projectModel.description;
    final ProjectType projectType = projectModel.type;
    final List<TechStack> techStack = projectModel.techStack;
    final TextStyle fontStyle = projectModel.textStyle;
    final String? demoUrl = projectModel.demoUrl;

    final double height = MediaQuery.of(context).size.height;

    Widget img() => Stack(
          alignment: Alignment.center,
          children: [
            /// photo slider
            CarouselSlider(
              carouselController: controller,
              options: CarouselOptions(
                  height: height,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  // autoPlayInterval: const Duration(seconds: 5),
                  onPageChanged: (index, _) {
                    setState(() {
                      currentIndex = index;
                    });
                  }),
              items: images
                  .map((item) => Center(
                          child: Image.network(
                        item,
                        fit: BoxFit.cover,
                        height: height,
                      )))
                  .toList(),
            ),

            /// Dot navigator
            Positioned(
              bottom: 20,
              child: DotsIndicator(
                dotsCount: images.length,
                position: currentIndex,
                onTap: (position) => controller.animateToPage(position),
                decorator: DotsDecorator(
                  color: MyPalette.white,
                  activeColor: MyPalette.yellow,
                  size: const Size.square(15),
                  activeSize: const Size(30, 15),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        );

    Widget feature() {
      Container tag(String text, Color bgColor, [bool isOutlined = false]) =>
          Container(
            decoration: BoxDecoration(
              color: isOutlined ? null : bgColor,
              border: Border.all(
                color: bgColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isOutlined ? 10 : 5),
              child: myText(text,
                  style: fontStyle.copyWith(
                    color: isOutlined ? bgColor : MyPalette.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          );

      return Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            /// Title
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Title
                  myText(title,
                      style: fontStyle.copyWith(
                        color: MyPalette.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                      )),

                  /// Subtitle
                  myText(subtitle, style: fontStyle),
                  const SizedBox(height: 40),

                  /// Type tag
                  tag(projectType.displayName, projectType.bgColor, true),
                ],
              ),
            ),

            /// Description & stacks
            Flexible(
              flex: 5,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myText(
                      description,
                      style: fontStyle,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myText('Build with stacks:',
                            style: fontStyle.copyWith(
                              fontSize: 12,
                            )),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 5,
                          runSpacing: 2,
                          children: [
                            for (TechStack tech in techStack)
                              tag(tech.displayName, tech.displayColor),
                          ],
                        ),
                      ],
                    ),

                    /// Demo
                    demoUrl != null
                        ? FilledButton(
                            onPressed: () => launchUrl(Uri.parse(demoUrl)),
                            style: FilledButton.styleFrom(
                              elevation: 5,
                              backgroundColor: MyPalette.black,
                              textStyle: fontStyle,
                            ),
                            child: myText('Demo', color: MyPalette.white),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      color: bgColor,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: isImgLeft ? img() : feature(),
          ),
          Flexible(
            flex: 1,
            child: isImgLeft ? feature() : img(),
          )
        ],
      ),
    );
  }
}
