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
            key: const ValueKey('aaaaaaaaax'),
            scale: a1.value,
            child: Opacity(
                key: const ValueKey('aaaaaaaaay'),
                opacity: a1.value,
                child: ProjectDetails(
                  key: const ValueKey('aaaaaaaaaz'),
                )),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return Container(
            key: const ValueKey('aaaaaaaaaaa'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final manage = Provider.of<ProjectcreenManager>(context);
    return Stack(
      key: const ValueKey('aaaaaaaaaab'),
      children: [
        SizedBox(
          key: const ValueKey('aaaaaaaaaac'),
          width: 390,
          height: 300,
          child: Image.asset(
            images[i],
            key: const ValueKey('aaaaaaaaaad'),
            fit: BoxFit.cover,
          ),
        ),
        AnimatedOpacity(
          key: const ValueKey('aaaaaaaaaae'),
          opacity: (manage.isHovered && (i == manage.hoveredIndex)) ? 1 : 0,
          duration: const Duration(milliseconds: 100),
          child: AnimatedContainer(
            key: const ValueKey('aaaaaaaaaaf'),
            duration: const Duration(milliseconds: 500),
            width: 390,
            height: 300,
            child: Column(
              key: const ValueKey('aaaaaaaaaag'),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SlideTransition(
                  key: const ValueKey('aaaaaaaaaah'),
                  position: bottomAnimations[i],
                  child: Column(
                    key: const ValueKey('aaaaaaaaaai'),
                    children: [
                      Text(
                        subTiltles.keys.toList()[i],
                        key: const ValueKey('aaaaaaaaaaj'),
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: 21.3,
                          color: const Color(0xff1b242f),
                        ),
                      ),
                      Text(
                        subTiltles.values.toList()[i],
                        key: const ValueKey('aaaaaaaaaak'),
                        style: GoogleFonts.raleway(
                          fontSize: 16,
                          color: const Color(0xffe31b6d),
                        ),
                      ),
                    ],
                  ),
                ),
                SlideTransition(
                  key: const ValueKey('aaaaaaaaaal'),
                  position: topAnimations[i],
                  child: InkWell(
                    key: const ValueKey('aaaaaaaaaam'),
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
                      key: const ValueKey('aaaaaaaaaan'),
                      duration: const Duration(milliseconds: 200),
                      width: 170,
                      decoration: BoxDecoration(
                          color:
                              (manage.buttonHovered && manage.hoveredIndex == i)
                                  ? const Color(0xffe31c6e)
                                  : null,
                          border: Border.all(color: Colors.pink, width: 2)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: Center(
                        key: const ValueKey('aaaaaaaaaao'),
                        child: Text(
                          'LEARN MORE',
                          key: const ValueKey('aaaaaaaaaap'),
                          style: GoogleFonts.raleway(
                            fontSize: 17.3,
                            color: (manage.buttonHovered &&
                                    manage.hoveredIndex == i)
                                ? Colors.white
                                : const Color(0xff1b242f),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            color: const Color(0xfff5f5f5),
          ),
        ),
      ],
    );
  }
}
