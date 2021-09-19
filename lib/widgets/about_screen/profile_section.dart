import 'package:basil_personal_web/sections/about_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final AboutScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: ValueKey('aaaaas'),
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          'assets/prof.png',
          key: ValueKey('aaaaat'),
          height: 300,
          width: 300,
        ),
        Padding(
          key: ValueKey('aaaaau'),
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Container(
            key: ValueKey('aaaaav'),
            child: Text(
              'Who\'s this guy?',
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xff666361)),
            ),
          ),
        ),
        Padding(
          key: ValueKey('aaaaaw'),
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            key: ValueKey('aaaaax'),
            children: [
              Container(
                key: ValueKey('aaaaay'),
                width: 500,
                child: Text(
                  "I'm a freelancing Developer from Kerala,Inida.I have serious passion for UI effects, animations and creating intuitive, dynamic user experiences.",
                  key: ValueKey('aaaaaz'),
                  style: GoogleFonts.raleway(
                      fontSize: 16, color: Color(0xff616161)),
                  textAlign: TextAlign.center,
                ),
              ),
              InkWell(
                key: ValueKey('aaaaaaa'),
                onTap: () {
                  widget.scroll!(4);
                },
                child: Padding(
                  key: ValueKey('aaaaaab'),
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Let\'s make something special.',
                    key: ValueKey('aaaaaac'),
                    style: GoogleFonts.raleway(
                        fontSize: 16, color: Color(0xff039bda)),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
