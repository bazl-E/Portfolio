import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    Key? key,
    required Animation<num>? transformAnimation,
    required Animation<double>? opacityAnimation,
    required this.title,
    required this.descrption,
    required this.icon,
  })  : _transformAnimation = transformAnimation,
        _opacityAnimation = opacityAnimation,
        super(key: key);

  final Animation<num>? _transformAnimation;
  final Animation<double>? _opacityAnimation;
  final String? title;
  final String? descrption;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (ctx, sizeInfo) {
      final double tileSize = sizeInfo.isMobile ? 80 : 120;
      final double iconSize = sizeInfo.isMobile ? 45 : 60;
      final double titleSize = sizeInfo.isMobile ? 18.6 : 24;
      final double descrptionSize = sizeInfo.isMobile ? 10.6 : 16;
      final double descrptionBoxSize = sizeInfo.isMobile ? 35.41.w : 250;
      return Container(
        key: const ValueKey('aaaas'),
        child: Column(
          key: const ValueKey('aaaat'),
          children: [
            Stack(
              key: const ValueKey('aaaau'),
              children: [
                FadeTransition(
                  key: const ValueKey('aaaav'),
                  opacity: _opacityAnimation!,
                  child: AnimatedContainer(
                    key: const ValueKey('aaaaw'),
                    transformAlignment: Alignment.center,
                    duration: const Duration(seconds: 1),
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(pi * _transformAnimation!.value.toDouble()),
                    child: Image.asset(
                      'assets/hexa.png',
                      key: const ValueKey('aaaax'),
                      width: tileSize,
                      height: tileSize,
                      color: const Color(0xff05c2c9),
                    ),
                  ),
                ),
                Positioned(
                  key: const ValueKey('aaaay'),
                  // height: 115,
                  // width: 123,
                  height: tileSize,
                  width: tileSize,
                  child: AnimatedContainer(
                    key: const ValueKey('aaaaz'),
                    transformAlignment: Alignment.center,
                    duration: const Duration(seconds: 1),
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(pi * _transformAnimation!.value.toDouble()),
                    child: Icon(
                      icon!,
                      key: const ValueKey('aaaaaa'),
                      size: iconSize,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              key: const ValueKey('aaaaab'),
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Container(
                key: const ValueKey('aaaaac'),
                child: FadeTransition(
                  key: const ValueKey('aaaaad'),
                  opacity: _opacityAnimation!,
                  // .value.toDouble(),
                  // duration: Duration(seconds: 2),
                  child: Text(
                    title!,
                    key: const ValueKey('aaaaae'),
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold,
                        fontSize: titleSize,
                        color: const Color(0xff666361)),
                  ),
                ),
              ),
            ),
            Padding(
              key: const ValueKey('aaaaaf'),
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: SizedBox(
                key: const ValueKey('aaaaag'),
                width: descrptionBoxSize,
                child: FadeTransition(
                  key: const ValueKey('aaaaah'),
                  // duration: Duration(seconds: 2),
                  opacity: _opacityAnimation!,
                  // .value.toDouble(),
                  child: Text(
                    descrption!,
                    key: const ValueKey('aaaaai'),
                    style: GoogleFonts.raleway(
                        fontSize: descrptionSize,
                        color: const Color(0xff616161)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
