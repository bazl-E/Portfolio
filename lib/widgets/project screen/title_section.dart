import 'package:basil_personal_web/providers/project_screen_manage.dart';
import 'package:basil_personal_web/widgets/project%20screen/project_title.dart';
import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    Key? key,
    required this.manage,
    required this.titles,
  }) : super(key: key);

  final ProjectcreenManager manage;
  final List titles;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Stack(
          children: [
            AnimatedPositioned(
                bottom: 0,
                top: 0,
                left: manage.titleButtonindex! * 212.5,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 50),
                  width: 200,
                  height: 30,
                  color: Colors.pink,
                ),
                duration: Duration(milliseconds: 200)),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var i = 0; i < 4; i++)
                    ProjectTitle(
                        i: i,
                        title: titles[i],
                        color: i == manage.titleButtonindex
                            ? Colors.white
                            : Color(0xff626262))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
