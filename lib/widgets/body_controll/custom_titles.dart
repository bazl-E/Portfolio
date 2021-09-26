import 'package:basil_personal_web/providers/body_controll_manage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomTitles extends StatelessWidget {
  const CustomTitles({
    Key? key,
    required this.i,
    required this.scrollToIndex,
    required this.goToHome,
    required this.titles,
  }) : super(key: key);

  final int i;
  final Future Function(int i)? scrollToIndex;
  final Function goToHome;
  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    final falamanage = Provider.of<BodyControllManager>(context, listen: false);
    final manage = Provider.of<BodyControllManager>(context);
    return InkWell(
      key: ValueKey('aaaaaaag'),
      onTap: () async {
        if (i == 0) {
          await goToHome();
        } else {
          scrollToIndex!(i);
        }
        falamanage.setselectedButton(i);
      },
      onHover: (t) {
        if (t) {
          falamanage.setcurrentButton(i);
        }
        if (!t) {
          falamanage.setcurrentButton(null);
        }
      },
      child: Container(
          key: ValueKey('aaaaaaah'),
          margin: EdgeInsets.symmetric(horizontal: 20),
          // width: 100,
          height: 53,
          child: Center(
            key: ValueKey('aaaaaaai'),
            child: AnimatedDefaultTextStyle(
                child: Text(
                  titles[i],
                  key: ValueKey('aaaaaaaj'),
                ),
                style: GoogleFonts.raleway(
                    color:
                        manage.selectedButton == i || manage.currentButton == i
                            ? Colors.pink
                            : Colors.white,
                    fontSize: 16),
                duration: Duration(milliseconds: 400)),
          )),
    );
  }
}
