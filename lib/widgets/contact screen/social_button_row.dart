import 'package:basil_personal_web/providers/contact_screen_manager.dart';
import 'package:basil_personal_web/sections/contact_screen.dart';
import 'package:basil_personal_web/widgets/contact%20screen/social_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_button.dart';

class SocialButtonRow extends StatelessWidget {
  const SocialButtonRow({
    Key? key,
    required this.animations2,
    required this.animations,
    required this.controllers,
    required this.falmanage,
    required this.widget,
    required this.manage,
  }) : super(key: key);

  final List<Animation<Offset>> animations2;
  final List<Animation<Offset>> animations;
  final List<AnimationController> controllers;
  final ContactscreenManager falmanage;
  final ContactScreen widget;
  final ContactscreenManager manage;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 3,
        child: Container(
          height: double.infinity,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                          animations2: animations2,
                          animations: animations,
                          controllers: controllers,
                          image: 'assets/11.png',
                          index: 0,
                          url: 'https://github.com/bazl-E'),
                      SizedBox(width: 30),
                      SocialButton(
                          animations2: animations2,
                          animations: animations,
                          controllers: controllers,
                          image: 'assets/12.png',
                          index: 1,
                          url:
                              'https://www.linkedin.com/mwlite/in/muhammed-basil-0a2b691b2'),
                      SizedBox(width: 30),
                      SocialButton(
                          animations2: animations2,
                          animations: animations,
                          controllers: controllers,
                          image: 'assets/13.png',
                          index: 2,
                          url:
                              'https://www.facebook.com/profile.php?id=100005176755893'),
                      SizedBox(width: 30),
                      SocialButton(
                          animations2: animations2,
                          animations: animations,
                          controllers: controllers,
                          image: 'assets/14.png',
                          index: 3,
                          url: 'https://twitter.com/MhdBasil_E'),
                      SizedBox(width: 30),
                      SocialButton(
                          animations2: animations2,
                          animations: animations,
                          controllers: controllers,
                          image: 'assets/15.png',
                          index: 4,
                          url: 'https://linktree-basil.web.app/'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Muhammed Basil E',
                        style: GoogleFonts.raleway(
                            color: Color(0xff515a66), fontSize: 14),
                      ),
                      SizedBox(width: 3),
                      Text(
                        '©2021',
                        style: GoogleFonts.raleway(
                            color: Colors.pink, fontSize: 14),
                      ),
                    ],
                  )
                ],
              ),
              HomeButton(falmanage: falmanage, widget: widget, manage: manage),
            ],
          ),
          color: Color(0xff1b242f),
        ));
  }
}
