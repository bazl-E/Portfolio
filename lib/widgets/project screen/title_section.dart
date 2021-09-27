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
      key: const ValueKey('aaaaaaaaaav'),
      fit: BoxFit.scaleDown,
      child:
          //  LayoutBuilder(
          //   key: ValueKey('aaaaaaaaaaw'),
          // builder: (BuildContext context, BoxConstraints constraints) =>
          Stack(
        key: const ValueKey('aaaaaaaaaax'),
        children: [
          AnimatedPositioned(
              key: const ValueKey('aaaaaaaaaay'),
              bottom: 0,
              top: 0,
              left: manage.titleButtonindex! * 212.5,
              child: AnimatedContainer(
                key: const ValueKey('aaaaaaaaaaz'),
                duration: const Duration(milliseconds: 50),
                width: 200,
                height: 30,
                color: Colors.pink,
              ),
              duration: const Duration(milliseconds: 200)),
          Container(
            key: const ValueKey('aaaaaaaaaaaa'),
            child: Row(
              key: const ValueKey('aaaaaaaaaaab'),
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var i = 0; i < 4; i++)
                  ProjectTitle(
                      key: ValueKey('aaaaaaaaaaac$i'),
                      i: i,
                      title: titles[i],
                      color: i == manage.titleButtonindex
                          ? Colors.white
                          : const Color(0xff626262))
              ],
            ),
          )
        ],
      ),
      // ),
    );
  }
}
