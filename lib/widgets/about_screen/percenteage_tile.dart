import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PercentageTile extends StatelessWidget {
  PercentageTile({
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

    return Container(
      key: ValueKey('aaaaaj'),
      margin: EdgeInsets.only(top: 6, bottom: 6, left: 6),
      width: totalWidth,
      color: Color(0xffeeeeee),
      height: 31,
      child: Row(
        key: ValueKey('aaaaak'),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            key: ValueKey('aaaaal'),
            children: [
              Container(
                key: ValueKey('aaaaam'),
                height: 31,
                width: 150,
                color: Color(0xff05c2c9),
                child: Center(
                  key: ValueKey('aaaaan'),
                  child: Text(title!,
                      key: ValueKey('aaaaao'),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              AnimatedContainer(
                key: ValueKey('aaaaap'),
                duration: Duration(seconds: 1),
                width: getWidth!(percent!, context),
                height: 31,
                color: Color(0xff01a1a7),
              ),
            ],
          ),
          Padding(
            key: ValueKey('aaaaaq'),
            padding: const EdgeInsets.all(8.0),
            child: Text('${percent.toString()}%',
                key: ValueKey('aaaaar'),
                style: GoogleFonts.raleway(
                  fontSize: 14,
                  color: Color(0xff8d8d8d),
                )),
          )
        ],
      ),
    );
  }
}
