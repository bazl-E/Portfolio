import 'package:basil_personal_web/providers/project_screen_manage.dart';
import 'package:basil_personal_web/widgets/project%20screen/project_detals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({
    Key? key,
    required this.i,
    required this.images,
    required this.subTiltles,
    required this.topAnimations,
    required this.bottomAnimations,
  }) : super(key: key);
  final int i;
  final List<String> images;
  final Map<String, String> subTiltles;
  final List<Animation<Offset>> topAnimations;
  final List<Animation<Offset>> bottomAnimations;

  void showcustomDialog(BuildContext context) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(opacity: a1.value, child: ProjectDetails()),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    final manage = Provider.of<ProjectcreenManager>(context);
    return Stack(
      children: [
        Container(
          width: 390,
          height: 300,
          child: Image.asset(
            images[i],
            fit: BoxFit.cover,
          ),
        ),
        AnimatedOpacity(
          opacity: (manage.isHovered && (i == manage.hoveredIndex)) ? 1 : 0,
          duration: Duration(milliseconds: 100),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: 390,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SlideTransition(
                  position: bottomAnimations[i],
                  child: Column(
                    children: [
                      Text(
                        subTiltles.keys.toList()[i],
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: 21.3,
                          color: Color(0xff1b242f),
                        ),
                      ),
                      Text(
                        subTiltles.values.toList()[i],
                        style: GoogleFonts.raleway(
                          fontSize: 16,
                          color: Color(0xffe31b6d),
                        ),
                      ),
                    ],
                  ),
                ),
                SlideTransition(
                  position: topAnimations[i],
                  child: InkWell(
                    onTap: () {
                      showcustomDialog(context);
                    },
                    onHover: (t) {
                      if (t) {
                        manage.setButtonHovered(true);
                      } else {
                        manage.setButtonHovered(false);
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: 170,
                      decoration: BoxDecoration(
                          color:
                              (manage.buttonHovered && manage.hoveredIndex == i)
                                  ? Color(0xffe31c6e)
                                  : null,
                          border: Border.all(color: Colors.pink, width: 2)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Center(
                        child: Text(
                          'LEARN MORE',
                          style: GoogleFonts.raleway(
                            fontSize: 17.3,
                            color: (manage.buttonHovered &&
                                    manage.hoveredIndex == i)
                                ? Colors.white
                                : Color(0xff1b242f),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            color: Color(0xfff5f5f5),
          ),
        ),
      ],
    );
  }
}
