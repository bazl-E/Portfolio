import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Statements extends StatelessWidget {
  Statements({
    Key? key,
    required this.title,
    required this.icon,
    required this.colorOfIcon,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Color colorOfIcon;

  final TextStyle style = GoogleFonts.ubuntu(
    color: Colors.white,
    fontSize: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: .5,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: colorOfIcon,
            size: 15,
          ),
          SizedBox(width: 5),
          Text(
            title,
            style: style,
          ),
        ],
      ),
    );
  }
}
