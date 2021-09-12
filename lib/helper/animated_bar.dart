import 'package:flutter/material.dart';

///A row of buttons with animated selection
class AnimatedBar extends StatefulWidget {
  ///Duration for the selection animation

  final Color? backgroundColor;
  final Color? foregroundColor;

  final List<BarEntry> children;

  final EdgeInsets padding;

  final bool invertedSelection;

  const AnimatedBar({
    required this.children,
    this.backgroundColor,
    this.foregroundColor,
    this.padding = const EdgeInsets.all(0),
    this.invertedSelection = false,
  });

  @override
  _AnimatedBarState createState() => _AnimatedBarState();
}

class _AnimatedBarState extends State<AnimatedBar> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor =
        widget.backgroundColor ?? Theme.of(context).backgroundColor;
    return Padding(
      padding: widget.padding,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Card(
          color: backgroundColor,
          child: Stack(
            fit: StackFit.loose,
            children: [
              AnimatedPositioned(
                top: 0,
                bottom: 0,
                left: constraints.maxWidth / widget.children.length * _index,
                right: (constraints.maxWidth / widget.children.length) *
                    (widget.children.length - _index - 1),
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.foregroundColor ??
                        Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              Row(
                children: [
                  for (var i = 0; i == (widget.children.length - 1); i++)
                    //           Expanded(
                    InkWell(
                      onTap: () {
                        widget.children[i].onTap();

                        setState(() {
                          _index = i;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Center(
                            child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    backgroundColor,
                                    widget.invertedSelection && _index == i
                                        ? BlendMode.srcIn
                                        : BlendMode.dstIn),
                                child: widget.children[i].child)),
                      ),
                    ),
                ],
                // children: widget.children
                //     .asMap()
                //     .map((i, sideButton) => MapEntry(
                //           i,
                //           Expanded(
                //             child: InkWell(
                //               onTap: () {
                //                 sideButton.onTap();

                //                 setState(() {
                //                   _index = i;
                //                 });
                //               },
                //               child: Padding(
                //                 padding: EdgeInsets.symmetric(vertical: 5),
                //                 child: Center(
                //                     child: ColorFiltered(
                //                         colorFilter: ColorFilter.mode(
                //                             backgroundColor,
                //                             widget.invertedSelection &&
                //                                     _index == i
                //                                 ? BlendMode.srcIn
                //                                 : BlendMode.dstIn),
                //                         child: sideButton.child)),
                //               ),
                //             ),
                //           ),
                //         ))
                //     .values
                //     .toList(),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class BarEntry {
  final Widget child;
  final VoidCallback onTap;
  BarEntry({required this.child, required this.onTap});
}
