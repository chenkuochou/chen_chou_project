import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Home extends HookWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final textSize = useState(20.0);
    final textColor = useState(Colors.black);
    final ValueNotifier<double> scrollingPosition = useState(0.0);

    final ScrollController scrollController = useScrollController();
    useEffect(() {
      scrollController.addListener(() {
        // textSize.value = 20.0 - scrollController.offset * 0.05;
        // if (textSize.value < 12.0) textSize.value = 12.0;
        double colorValue =
            (scrollController.offset / size.height * 2) * 255 - 3;
        if (colorValue > 255) {
          colorValue = colorValue % 255;
        }
        if (colorValue < 3) {
          colorValue = (scrollController.offset / size.height * 2) * 255;
        }
        textColor.value = Color.fromARGB(
            255, colorValue.toInt(), colorValue.toInt(), colorValue.toInt());
        scrollingPosition.value = scrollController.offset;
      });
      return null;
    }, [scrollController]);

    final List<String> titles = ['asdasd', '22fuehuw', '', '44', ''];
    const Color color = Color(0xffF2F0EC);

    Widget halfHighSizeBox() => SizedBox(
          width: size.width,
          height: size.height / 2,
        );

    Widget imageRow(double topPadding) => Padding(
          padding: EdgeInsets.only(top: topPadding),
          child: Center(
            child: Container(
              color: color,
              width: size.width,
              height: size.height,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Row(
                children: [
                  Image(
                    image: AssetImage('assets/img/whisper7-portrait.png'),
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        );

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Text(
              // scrollingPosition.value.toString(),
              titles[(scrollingPosition.value / size.height).toInt()],
              style: TextStyle(
                // fontSize: textSize.value,
                color: textColor.value,
              ),
            ),
          ),
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                imageRow(size.height),
                halfHighSizeBox(),
                imageRow(0),
                halfHighSizeBox(),
                imageRow(0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
