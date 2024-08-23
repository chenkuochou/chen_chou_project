import 'package:chen_chou_project/text_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Home extends HookWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pageHeight = size.height;

    final blackColor = useState<Color>(Colors.black);
    final greyColor = useState<Color>(Colors.grey);
    final textWidget =
        useState<Widget>(buildTitles(blackColor.value, greyColor.value)[0]);
    final scrollController = useScrollController();

    useEffect(() {
      final ranges = [
        [0.0, 1.0],
        [1.35, 2.3],
        [2.85, 3.8],
        [4.35, 5.3],
        [5.85, 6.8],
        [7.35, 8.2],
      ];

      void updateColorsAndWidget(int index, double pageFold) {
        if (index == 0) {
          final ratio = pageFold.clamp(0.0, 1.0);
          blackColor.value = Color.lerp(
              Colors.black, Theme.of(context).scaffoldBackgroundColor, ratio)!;
          greyColor.value = Color.lerp(
              Colors.grey, Theme.of(context).scaffoldBackgroundColor, ratio)!;
        } else {
          final min = ranges[index][0];
          final max = ranges[index][1];
          final ratio = ((scrollController.offset - pageHeight * min) /
                  pageHeight *
                  (max - min))
              .clamp(0.0, 1.0);
          lerpColor(bool isBlack) => Color.lerp(
              Theme.of(context).scaffoldBackgroundColor,
              isBlack ? Colors.black : Colors.grey,
              (ratio <= 0.5 ? ratio : 1 - ratio) * 2)!;

          blackColor.value = lerpColor(true);
          greyColor.value = lerpColor(false);
        }
        textWidget.value =
            buildTitles(blackColor.value, greyColor.value)[index];
      }

      scrollController.addListener(() {
        final pageFold = scrollController.offset / pageHeight;

        final index = ranges
            .indexWhere((range) => pageFold >= range[0] && pageFold < range[1]);

        if (index == -1) {
          blackColor.value =
              greyColor.value = Theme.of(context).scaffoldBackgroundColor;
          textWidget.value = const SizedBox.shrink();
        } else {
          updateColorsAndWidget(index, pageFold);
        }
      });

      return scrollController.dispose;
    }, [scrollController]);

    Widget imageRow(List<String> picUrl, [double topPadding = 0]) => Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: Center(
            child: Container(
                color: Colors.transparent,
                width: size.width,
                height: pageHeight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: picUrl
                      .map((e) => SizedBox(
                          width: (size.width - 40) / 3,
                          child: Image.asset('assets/img/$e.png',
                              fit: BoxFit.contain)))
                      .toList(),
                ))));

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: textWidget.value,
          ),
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                imageRow(['mot3', 'rus1', 'whi1'], pageHeight),
                SizedBox(width: size.width, height: pageHeight / 2),
                imageRow(['rus1', 'rus2', 'rus3']),
                SizedBox(width: size.width, height: pageHeight / 2),
                imageRow(['mot2', 'mot4', 'mot9']),
                SizedBox(width: size.width, height: pageHeight / 2),
                imageRow(['bas1', 'bas3', 'bas4']),
                SizedBox(width: size.width, height: pageHeight / 2),
                imageRow(['whi2', 'whi3', 'whi4']),
                SizedBox(width: size.width, height: pageHeight)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
