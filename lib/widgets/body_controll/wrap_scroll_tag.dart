import 'package:basil_personal_web/providers/body_controll_manage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:visibility_detector/visibility_detector.dart';

class WrapScrollTag extends StatelessWidget {
  const WrapScrollTag({
    Key? key,
    required this.index,
    required this.autoScrollController,
    required this.child,
  }) : super(key: key);

  final int? index;
  final AutoScrollController? autoScrollController;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final falamanage = Provider.of<BodyControllManager>(context, listen: false);
    return VisibilityDetector(
        key: Key('$index'),
        onVisibilityChanged: (visibilityInfo) {
          var visiblePercentage = visibilityInfo.visibleFraction * 100;

          if (visiblePercentage > 20) {
            falamanage.setselectedButton(index);
          } else {}
        },
        child: AutoScrollTag(
          key: ValueKey(index),
          controller: autoScrollController!,
          index: index!,
          child: child!,
        ));
  }
}
