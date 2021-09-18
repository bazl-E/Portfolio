import 'package:basil_personal_web/providers/contact_screen_manager.dart';
import 'package:basil_personal_web/sections/contact_screen.dart';
import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    Key? key,
    required this.falmanage,
    required this.widget,
    required this.manage,
  }) : super(key: key);

  final ContactscreenManager falmanage;
  final ContactScreen widget;
  final ContactscreenManager manage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -30,
      left: (MediaQuery.of(context).size.width / 2) - 25,
      child: InkWell(
        onHover: (t) {
          if (t) {
            falmanage.setisHomeButtonHovered(true);
          } else {
            falmanage.setisHomeButtonHovered(false);
          }
        },
        onTap: widget.gotoHome,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 350),
          color: manage.isHomeButtonHovered ? Colors.pinkAccent : Colors.pink,
          width: 50,
          height: 55,
          child: RotatedBox(
            quarterTurns: 3,
            child: Icon(
              Icons.double_arrow,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
