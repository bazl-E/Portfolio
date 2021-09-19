import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              FadeTransition(
                opacity: _opacityAnimation!,
                child: AnimatedContainer(
                  transformAlignment: Alignment.center,
                  duration: Duration(seconds: 1),
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(pi * _transformAnimation!.value.toDouble()),
                  child: Image.asset(
                    'assets/hexa.png',
                    width: 120,
                    height: 120,
                    color: Color(0xff05c2c9),
                  ),
                ),
              ),
              Positioned(
                height: 115,
                width: 123,
                child: AnimatedContainer(
                  transformAlignment: Alignment.center,
                  duration: Duration(seconds: 1),
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(pi * _transformAnimation!.value.toDouble()),
                  child: Icon(
                    icon!,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Container(
              child: FadeTransition(
                opacity: _opacityAnimation!,
                // .value.toDouble(),
                // duration: Duration(seconds: 2),
                child: Text(
                  title!,
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xff666361)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Container(
              width: 250,
              child: FadeTransition(
                // duration: Duration(seconds: 2),
                opacity: _opacityAnimation!,
                // .value.toDouble(),
                child: Text(
                  descrption!,
                  style: GoogleFonts.raleway(
                      fontSize: 16, color: Color(0xff616161)),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
