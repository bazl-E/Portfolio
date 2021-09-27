import 'package:basil_personal_web/sections/about_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final AboutScreen widget;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (ctx, sizeInfo) {
      final double tileSize = sizeInfo.isMobile ? 200 : 300;
      final double titleSize = sizeInfo.isMobile ? 18.6 : 24;
      final double descrptionSize = sizeInfo.isMobile ? 10.6 : 16;
      final double descrptionBoxSize = sizeInfo.isMobile ? 70.w : 500;

      return Column(
        key: const ValueKey('aaaaas'),
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/prof.png',
            key: const ValueKey('aaaaat'),
            height: tileSize,
            width: tileSize,
          ),
          Padding(
            key: const ValueKey('aaaaau'),
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Container(
              key: const ValueKey('aaaaav'),
              child: Text(
                'Who\'s this guy?',
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold,
                    fontSize: titleSize,
                    color: const Color(0xff666361)),
              ),
            ),
          ),
          Padding(
            key: const ValueKey('aaaaaw'),
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(
              key: const ValueKey('aaaaax'),
              children: [
                SizedBox(
                  key: const ValueKey('aaaaay'),
                  width: descrptionBoxSize,
                  child: Text(
                    "I'm a freelancing Developer from Kerala,Inida.I have serious passion for UI effects, animations and creating intuitive, dynamic user experiences.",
                    key: const ValueKey('aaaaaz'),
                    style: GoogleFonts.raleway(
                        fontSize: descrptionSize,
                        color: const Color(0xff616161)),
                    textAlign: TextAlign.center,
                  ),
                ),
                InkWell(
                  key: const ValueKey('aaaaaaa'),
                  onTap: () {
                    widget.scroll!(4);
                  },
                  child: Padding(
                    key: const ValueKey('aaaaaab'),
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Let\'s make something special.',
                      key: const ValueKey('aaaaaac'),
                      style: GoogleFonts.raleway(
                          fontSize: descrptionSize,
                          color: const Color(0xff039bda)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
