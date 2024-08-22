import 'package:chen_chou_project/data/text_data.dart';
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
      scrollController.addListener(() {
        double pageFold = scrollController.offset / pageHeight;
        // print('$pageFold ${scrollController.offset} $pageHeight');

        List<Widget> list = buildTitles(blackColor.value, greyColor.value);
        Color getColor(double pageFoldMin, double pageFoldMax,
            [bool isBlack = true]) {
          final double ratio =
              ((scrollController.offset - pageHeight * pageFoldMin) /
                      pageHeight *
                      (pageFoldMax - pageFoldMin))
                  .clamp(0.0, 1.0);
          return ratio <= 0.5
              ? Color.lerp(Theme.of(context).scaffoldBackgroundColor,
                  isBlack ? Colors.black : Colors.grey, ratio * 2)!
              : Color.lerp(
                  isBlack ? Colors.black : Colors.grey,
                  Theme.of(context).scaffoldBackgroundColor,
                  (ratio - 0.5) * 2)!;
        }

        if (pageFold < 1) {
          final ratio = (scrollController.offset / pageHeight).clamp(0.0, 1.0);
          blackColor.value = Color.lerp(
              Colors.black,
              Theme.of(context).scaffoldBackgroundColor,
              ratio.clamp(0.0, 1.0))!;
          greyColor.value = Color.lerp(
              Colors.grey,
              Theme.of(context).scaffoldBackgroundColor,
              ratio.clamp(0.0, 1.0))!;
          textWidget.value = list[0];
        } else if (pageFold > 1.35 && pageFold < 2.5) {
          blackColor.value = getColor(1.35, 2.3);
          greyColor.value = getColor(1.35, 2.3, false);
          textWidget.value = list[1];
        } else if (pageFold > 2.85 && pageFold < 4) {
          blackColor.value = getColor(2.85, 3.8);
          greyColor.value = getColor(2.85, 3.8, false);
          textWidget.value = list[2];
        } else if (pageFold > 4.35 && pageFold < 5.5) {
          blackColor.value = getColor(4.35, 5.3);
          greyColor.value = getColor(4.35, 5.3, false);
          textWidget.value = list[3];
        } else if (pageFold > 5.85 && pageFold < 7) {
          blackColor.value = getColor(5.85, 6.8);
          greyColor.value = getColor(5.85, 6.8, false);
          textWidget.value = list[4];
        } else if (pageFold > 7.35) {
          blackColor.value = getColor(7.35, 8.2);
          greyColor.value = getColor(7.35, 8.2, false);
          textWidget.value = list[5];
        } else {
          blackColor.value = Theme.of(context).scaffoldBackgroundColor;
          greyColor.value = Theme.of(context).scaffoldBackgroundColor;
          textWidget.value = const SizedBox.shrink();
        }
      });
      return () => scrollController.dispose();
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
