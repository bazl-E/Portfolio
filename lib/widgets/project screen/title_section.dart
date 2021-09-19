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
      key: ValueKey('aaaaaaaaaav'),
      fit: BoxFit.scaleDown,
      child: LayoutBuilder(
        key: ValueKey('aaaaaaaaaaw'),
        builder: (BuildContext context, BoxConstraints constraints) => Stack(
          key: ValueKey('aaaaaaaaaax'),
          children: [
            AnimatedPositioned(
                key: ValueKey('aaaaaaaaaay'),
                bottom: 0,
                top: 0,
                left: manage.titleButtonindex! * 212.5,
                child: AnimatedContainer(
                  key: ValueKey('aaaaaaaaaaz'),
                  duration: Duration(milliseconds: 50),
                  width: 200,
                  height: 30,
                  color: Colors.pink,
                ),
                duration: Duration(milliseconds: 200)),
            Container(
              key: ValueKey('aaaaaaaaaaaa'),
              child: Row(
                key: ValueKey('aaaaaaaaaaab'),
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var i = 0; i < 4; i++)
                    ProjectTitle(
                        key: ValueKey('aaaaaaaaaaac$i'),
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
