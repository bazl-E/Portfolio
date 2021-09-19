import 'package:basil_personal_web/providers/project_screen_manage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProjectTitle extends StatelessWidget {
  const ProjectTitle({
    Key? key,
    required this.i,
    required this.title,
    required this.color,
  }) : super(key: key);

  final int i;
  final String title;
  final Color color;

  int length(int i) {
    if (i == 0) {
      return 9;
    }
    if (i == 1) {
      return 2;
    }
    if (i == 2) {
      return 3;
    }

    return 4;
  }

  @override
  Widget build(BuildContext context) {
    final manage = Provider.of<ProjectcreenManager>(context, listen: false);

    return InkWell(
      key: ValueKey('aaaaaaaaaaq'),
      onTap: () {
        manage.settitleButtonindex(i);
        manage.setListLength(length(i));
      },
      child: Container(
        key: ValueKey('aaaaaaaaaar'),
        margin: EdgeInsets.symmetric(
          horizontal: 5,
        ),
        width: 200,
        height: 33,
        child: Center(
            key: ValueKey('aaaaaaaaaas'),
            child: AnimatedDefaultTextStyle(
                key: ValueKey('aaaaaaaaaat'),
                child: Text(
                  title,
                  key: ValueKey('aaaaaaaaaau'),
                ),
                style: GoogleFonts.raleway(
                    fontSize: 18, color: color, fontWeight: FontWeight.w600),
                duration: Duration(milliseconds: 600))),
      ),
    );
  }
}
