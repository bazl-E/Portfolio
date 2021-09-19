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
      key: ValueKey('aaaaaaaaaaal'),
      opacity: .5,
      child: Row(
        key: ValueKey('aaaaaaaaaaam'),
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            key: ValueKey('aaaaaaaaaaan'),
            color: colorOfIcon,
            size: 15,
          ),
          SizedBox(
            width: 5,
            key: ValueKey('aaaaaaaaaaao'),
          ),
          Text(
            title,
            key: ValueKey('aaaaaaaaaaap'),
            style: style,
          ),
        ],
      ),
    );
  }
}
