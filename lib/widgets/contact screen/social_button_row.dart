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
    return
        // Flexible(
        //     key: ValueKey('aaaaaaap'),
        //     flex: 3,
        //     child:
        Container(
      key: const ValueKey('aaaaaaaq'),
      // height: double.infinity,
      child: Stack(
        key: const ValueKey('aaaaaaar'),
        clipBehavior: Clip.none,
        children: [
          Column(
            key: const ValueKey('aaaaaaas'),
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    key: const ValueKey('aaaaaaat'),
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                          key: const ValueKey('aaaaaaau'),
                          animations2: animations2,
                          animations: animations,
                          controllers: controllers,
                          image: 'assets/11.png',
                          index: 0,
                          url: 'https://github.com/bazl-E'),
                      const SizedBox(
                        width: 30,
                        key: ValueKey('aaaaaaav'),
                      ),
                      SocialButton(
                          key: const ValueKey('aaaaaaaw'),
                          animations2: animations2,
                          animations: animations,
                          controllers: controllers,
                          image: 'assets/12.png',
                          index: 1,
                          url:
                              'https://www.linkedin.com/mwlite/in/muhammed-basil-0a2b691b2'),
                      const SizedBox(
                        width: 30,
                        key: ValueKey('aaaaaaax'),
                      ),
                      SocialButton(
                          key: const ValueKey('aaaaaaay'),
                          animations2: animations2,
                          animations: animations,
                          controllers: controllers,
                          image: 'assets/13.png',
                          index: 2,
                          url:
                              'https://www.facebook.com/profile.php?id=100005176755893'),
                      const SizedBox(
                        width: 30,
                        key: ValueKey('aaaaaaaz'),
                      ),
                      SocialButton(
                          key: const ValueKey('aaaaaaaaa'),
                          animations2: animations2,
                          animations: animations,
                          controllers: controllers,
                          image: 'assets/14.png',
                          index: 3,
                          url: 'https://twitter.com/MhdBasil_E'),
                      const SizedBox(
                        width: 30,
                        key: ValueKey('aaaaaaaab'),
                      ),
                      SocialButton(
                          key: const ValueKey('aaaaaaaac'),
                          animations2: animations2,
                          animations: animations,
                          controllers: controllers,
                          image: 'assets/15.png',
                          index: 4,
                          url: 'https://linktree-basil.web.app/'),
                    ],
                  ),
                ),
              ),
              Row(
                key: const ValueKey('aaaaaaaad'),
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Muhammed Basil E',
                    key: const ValueKey('aaaaaaaae'),
                    style: GoogleFonts.raleway(
                        color: const Color(0xff515a66), fontSize: 14),
                  ),
                  const SizedBox(
                    width: 3,
                    key: ValueKey('aaaaaaaaf'),
                  ),
                  Text(
                    '©2021',
                    key: const ValueKey('aaaaaaaag'),
                    style:
                        GoogleFonts.raleway(color: Colors.pink, fontSize: 14),
                  ),
                ],
              )
            ],
          ),
          HomeButton(
            falmanage: falmanage,
            widget: widget,
            manage: manage,
            key: const ValueKey('aaaaaaaah'),
          ),
        ],
      ),
      color: const Color(0xff1b242f),
      // )
    );
  }
}
