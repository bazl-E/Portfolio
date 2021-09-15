import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key, this.height}) : super(key: key);
  final double? height;

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> with TickerProviderStateMixin {
  AnimationController? controller;
  AnimationController? controller2;
  Animation<Offset>? animae;
  Animation<Offset>? animae2;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    controller2 =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    animae = Tween<Offset>(begin: Offset(-12.5, 0), end: Offset(0, 0)).animate(
        CurvedAnimation(
            parent: controller!, curve: Curves.fastLinearToSlowEaseIn));
    animae2 = Tween<Offset>(begin: Offset(-18.5, 0), end: Offset(0, 0)).animate(
        CurvedAnimation(
            parent: controller2!, curve: Curves.fastLinearToSlowEaseIn));

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller!.forward();
      controller2!.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: min(widget.height!, double.infinity),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SlideTransition(
            position: animae!,
            child: Container(
              padding: EdgeInsets.only(top: 50, bottom: 10),
              child: Text(
                'BLOG',
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w700,
                    fontSize: 44,
                    color: Color(0xff444649)),
              ),
            ),
          ),
          SlideTransition(
            position: animae2!,
            child: Container(
              width: 70,
              height: 4,
              color: Color(0xff45474a),
            ),
          ),
        ],
      ),
    );
  }
}
