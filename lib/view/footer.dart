import 'package:chen_chou_project/common/constant/my_palette.dart';
import 'package:chen_chou_project/common/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          // myText('Logo'),
          // const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              myText('Copyright © 2024 Chen Chou',
                  style: GoogleFonts.poppins(
                    color: MyPalette.white,
                  )),
              FilledButton(
                onPressed: () => launchUrl(
                    Uri.parse('https://www.linkedin.com/in/chenkuochou/')),
                style: FilledButton.styleFrom(
                  backgroundColor: MyPalette.white,
                  textStyle: GoogleFonts.poppins(),
                ),
                child: myText(
                  'CONTACT ME',
                  color: MyPalette.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Container(
            color: Colors.white.withOpacity(0.2),
            height: 1,
          ),
        ],
      ),
    );
  }
}
