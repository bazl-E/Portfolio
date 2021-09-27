import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Statements extends StatelessWidget {
  const Statements({
    Key? key,
    required this.title,
    required this.icon,
    required this.colorOfIcon,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Color colorOfIcon;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (ctx, sizeInfo) {
      final TextStyle style = GoogleFonts.ubuntu(
        color: Colors.white,
        fontSize: sizeInfo.isMobile ? 8 : 10,
      );
      return Opacity(
        key: const ValueKey('aaaaaaaaaaal'),
        opacity: .5,
        child: Row(
          key: const ValueKey('aaaaaaaaaaam'),
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              key: const ValueKey('aaaaaaaaaaan'),
              color: colorOfIcon,
              size: 15,
            ),
            const SizedBox(
              width: 5,
              key: ValueKey('aaaaaaaaaaao'),
            ),
            Text(
              title,
              key: const ValueKey('aaaaaaaaaaap'),
              style: style,
            ),
          ],
        ),
      );
    });
  }
}
