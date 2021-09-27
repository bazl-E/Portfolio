import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';

class PercentageTile extends StatelessWidget {
  const PercentageTile({
    Key? key,
    required this.title,
    required this.percent,
    required this.getWidth,
  }) : super(key: key);

  final String? title;
  final double? percent;
  final double Function(double percet, BuildContext context)? getWidth;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final totalWidth = min((w * .9), 600).toDouble();

    return ResponsiveBuilder(builder: (ctx, sizeInfo) {
      // final double titleSize = sizeInfo.isMobile ? 9 : 14;
      final double titleSize = sizeInfo.isMobile
          ? 9
          : sizeInfo.isTablet
              ? 11
              : 13.5;

      final double titleBoxsize = sizeInfo.isMobile ? 12.w : 8.5.w;
      final double perBoxsize = sizeInfo.isMobile ? 3.h : 30;

      return Container(
        key: const ValueKey('aaaaaj'),
        margin: const EdgeInsets.only(top: 6, bottom: 6, left: 6),
        width: totalWidth,
        color: const Color(0xffeeeeee),
        height: perBoxsize,
        child: Row(
          key: const ValueKey('aaaaak'),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              key: const ValueKey('aaaaal'),
              children: [
                Container(
                  key: const ValueKey('aaaaam'),
                  height: perBoxsize,
                  width: titleBoxsize,
                  color: const Color(0xff05c2c9),
                  child: Center(
                    key: const ValueKey('aaaaan'),
                    child: Text(title!,
                        key: const ValueKey('aaaaao'),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.raleway(
                            fontSize: titleSize,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                AnimatedContainer(
                  key: const ValueKey('aaaaap'),
                  duration: const Duration(seconds: 1),
                  width: getWidth!(percent!, context),
                  height: perBoxsize,
                  color: const Color(0xff01a1a7),
                ),
              ],
            ),
            if (!sizeInfo.isMobile)
              Padding(
                key: const ValueKey('aaaaaq'),
                padding: const EdgeInsets.all(8.0),
                child: Text('${percent.toString()}%',
                    key: const ValueKey('aaaaar'),
                    style: GoogleFonts.raleway(
                      fontSize: 12,
                      color: const Color(0xff8d8d8d),
                    )),
              )
          ],
        ),
      );
    });
  }
}
