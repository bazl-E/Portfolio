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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          'assets/prof.png',
          height: 300,
          width: 300,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Container(
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
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            children: [
              Container(
                width: 500,
                child: Text(
                  "I'm a freelancing Developer from Kerala,Inida.I have serious passion for UI effects, animations and creating intuitive, dynamic user experiences.",
                  style: GoogleFonts.raleway(
                      fontSize: 16, color: Color(0xff616161)),
                  textAlign: TextAlign.center,
                ),
              ),
              InkWell(
                onTap: () {
                  widget.scroll!(4);
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Let\'s make something special.',
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
