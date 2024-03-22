import 'package:carousel_slider/carousel_slider.dart';
import 'package:chen_chou_project/common/constant/my_palette.dart';
import 'package:chen_chou_project/common/widget/my_text.dart';
import 'package:chen_chou_project/data/model/enum/project_type.dart';
import 'package:chen_chou_project/data/model/enum/tech_stack.dart';
import 'package:chen_chou_project/data/model/project_model.dart';
import 'package:chen_chou_project/data/source/projects.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({super.key});
  @override
  Widget build(BuildContext context) {
    const bool isImgLeft = true;
    const Color bgColor = MyPalette.white;
    final ProjectModel projectModel = projects[0];

    final String title = projectModel.name;
    final List<String> imageNames =
        projectModel.imageNames.map((e) => 'assets/img/$e.png').toList();
    final String subtitle = projectModel.subtitle;
    final String description = projectModel.description;
    final ProjectType projectType = projectModel.type;
    final List<TechStack> techStack = projectModel.techStack;
    final TextStyle fontStyle = projectModel.textStyle;

    final double height = MediaQuery.of(context).size.height;

    Widget img() => CarouselSlider(
          options: CarouselOptions(
            height: height,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            
          ),
          items: imageNames
              .map((item) => Container(
                    child: Center(
                        child: Image.network(
                      item,
                      fit: BoxFit.cover,
                      height: height,
                    )),
                  ))
              .toList(),
        );
    // CarouselSlider.builder(
    //     itemCount: 2,
    //     options: CarouselOptions(
    //       height: 800,
    //       initialPage: 0,
    //       // enlargeCenterPage: true,
    //       enableInfiniteScroll: false,
    //       scrollDirection: Axis.horizontal,
    //     ),
    //     itemBuilder: (context, index, realIndex) {
    //       return
    //       Container(
    //         decoration: BoxDecoration(
    //           image: DecorationImage(
    //             image: AssetImage(imageNames[index]),
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //       );
    //     });

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
            // Title
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title
                  myText(title,
                      style: fontStyle.copyWith(
                        color: MyPalette.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                      )),
                  // Subtitle
                  myText(subtitle, style: fontStyle),
                  const SizedBox(height: 40),
                  // Type tag
                  tag(projectType.displayName, projectType.bgColor, true),
                ],
              ),
            ),
            // Description & stacks
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
                      children: [
                        myText('Build with stacks:', size: 12),
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
                    // Demo
                    FilledButton(
                      onPressed: () {},
                      style: const ButtonStyle().copyWith(
                          elevation: const MaterialStatePropertyAll(5),
                          backgroundColor:
                              MaterialStateProperty.all(MyPalette.black)),
                      child: myText('Demo', color: MyPalette.white),
                    )
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
