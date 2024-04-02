import 'package:carousel_slider/carousel_slider.dart';
import 'package:chen_chou_project/common/common.dart';
import 'package:chen_chou_project/data/data.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Section extends StatefulWidget {
  const Section(this.projectModel, {super.key});
  final ProjectModel projectModel;

  @override
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> {
  late CarouselController carouselController;
  int currentIndex = 0;

  @override
  void initState() {
    carouselController = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String title = widget.projectModel.name;
    List<String> images = [];
    for (var i = 1; i < widget.projectModel.imageMeta.values.first + 1; i++) {
      images.add(
          'assets/img/${widget.projectModel.imageMeta.keys.first}$i-portrait.png');
    }
    final String subtitle = widget.projectModel.subtitle;
    final String description = widget.projectModel.description;
    final ProjectType projectType = widget.projectModel.type;
    final List<TechStack> techStack = widget.projectModel.techStack;
    final TextStyle fontStyle = widget.projectModel.textStyle;
    final String? demoUrl = widget.projectModel.demoUrl;
    final Color bgColor = widget.projectModel.bgColor;
    final bool isDarkTheme = widget.projectModel.isDarkTheme!;

    final double height = MediaQuery.of(context).size.height;

    Widget img() => Stack(
          alignment: Alignment.center,
          children: [
            /// photo slider
            CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                  height: height - 75,
                  viewportFraction: 1,
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
                onTap: (position) => carouselController.animateToPage(position),
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
              padding: EdgeInsets.symmetric(horizontal: isOutlined ? 10 : 7),
              child: myText(text,
                  style: fontStyle.copyWith(
                    color: isOutlined ? bgColor : MyPalette.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          );

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Title
                  myText(title,
                      style: fontStyle.copyWith(
                        color: !isDarkTheme ? MyPalette.black : MyPalette.white,
                        fontSize: 45,
                        fontWeight: FontWeight.w900,
                      )),

                  /// Subtitle
                  myText(subtitle, style: fontStyle),
                  const SizedBox(height: 40),

                  /// Type tag
                  tag(projectType.displayName, projectType.bgColor, true),
                ],
              ),
            ),
            Flexible(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Description
                  myText(description, style: fontStyle),

                  // /// Functions
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     // myText('Functions:',
                  //     //     style: fontStyle.copyWith(
                  //     //       fontSize: 12,
                  //     //     )),
                  //     for (var e in ['• Google map API', '• rare'])
                  //       myText(e,
                  //           style: fontStyle.copyWith(
                  //               // fontWeight: FontWeight.bold,
                  //               // color: MyPalette.black,
                  //               )),
                  //   ],
                  // ),

                  /// Stacks
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      myText('Build with',
                          style: fontStyle.copyWith(
                            fontSize: 11,
                          )),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: [
                          for (TechStack tech in techStack)
                            tag(tech.displayName, tech.displayColor),
                        ],
                      ),
                    ],
                  ),

                  /// Demo
                  demoUrl != null
                      ? Center(
                          child: FilledButton(
                            onPressed: () => launchUrl(Uri.parse(demoUrl)),
                            style: FilledButton.styleFrom(
                              elevation: !isDarkTheme ? 5 : null,
                              backgroundColor: !isDarkTheme
                                  ? MyPalette.black
                                  : MyPalette.white,
                              textStyle: fontStyle,
                            ),
                            child: myText(
                              'Demo',
                              color: !isDarkTheme
                                  ? MyPalette.white
                                  : MyPalette.black,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
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
            child: img(),
          ),
          Flexible(
            flex: 1,
            child: feature(),
          )
        ],
      ),
    );
  }
}
