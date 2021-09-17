import 'dart:math';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:basil_personal_web/widgets/about_screen/custom_tile.dart';
import 'package:basil_personal_web/widgets/about_screen/percenteage_tile.dart';
import 'package:basil_personal_web/widgets/about_screen/profile_section.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key? key, this.height, this.scroll}) : super(key: key);

  final double? height;
  final Future Function(int index)? scroll;

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with TickerProviderStateMixin {
  var width = 0;

  AnimationController? _controller;
  AnimationController? _controller2;
  AnimationController? _controller3;
  AnimationController? _controller4;

  Animation<Offset>? _slideAnimation;
  Animation<Offset>? _slideAnimation2;
  Animation<Offset>? _slideAnimation3;
  Animation<num>? _opacityAnimation;
  Animation<num>? _transformAnimation;

  double getWidth(double percent, BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final widt = min((w * .9), 600).toDouble();
    return width * (widt - 165) * (percent / 100);
  }

  @override
  void initState() {
    super.initState();
    _controller3 =
        AnimationController(vsync: this, duration: Duration(microseconds: 1));
    _opacityAnimation = Tween(begin: 0.0, end: 1).animate(CurvedAnimation(
      parent: _controller3!,
      curve: Curves.easeInOut,
    ));
    _controller4 =
        AnimationController(vsync: this, duration: Duration(microseconds: 4));
    _transformAnimation = Tween(begin: 1, end: 0.0).animate(CurvedAnimation(
      parent: _controller4!,
      curve: Curves.easeInOut,
    ));
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _slideAnimation = Tween<Offset>(begin: Offset(-10.5, 0), end: Offset(0, 0))
        .animate(
            CurvedAnimation(parent: _controller!, curve: Curves.fastOutSlowIn));
    _controller2 =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _slideAnimation2 = Tween<Offset>(begin: Offset(-10.5, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
            parent: _controller2!, curve: Curves.fastOutSlowIn));

    _slideAnimation3 = Tween<Offset>(begin: Offset(30, 0), end: Offset(0, 0))
        .animate(
            CurvedAnimation(parent: _controller!, curve: Curves.fastOutSlowIn));

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _controller!.forward().whenComplete(() {
        setState(() {
          width = 1;
        });
      });
      _controller2!.forward().whenComplete(() {});
      _controller3!.forward();
      _controller4!.forward();
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    _controller2!.dispose();
    _controller3!.dispose();
    _controller4!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 45, bottom: 10),
              child: SlideTransition(
                position: _slideAnimation!,
                child: Text(
                  'ABOUT',
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w700,
                      fontSize: 44,
                      color: Color(0xff444649)),
                ),
              ),
            ),
            SlideTransition(
              position: _slideAnimation2!,
              child: Container(
                width: 70,
                height: 4,
                color: Color(0xff45474a),
              ),
            ),
            SizedBox(height: 80),
            Container(
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                spacing: 40,
                runSpacing: 40,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  CustomTile(
                    icon: Icons.speed,
                    title: 'Fast',
                    descrption:
                        'Fast load times and lag free interaction, my highest priority.',
                    opacityAnimation: _opacityAnimation,
                    transformAnimation: _transformAnimation,
                  ),
                  CustomTile(
                    icon: Icons.lightbulb_outline,
                    title: 'Intuitive',
                    descrption:
                        'Strong preference for easy to use, intuitive UX/UI.',
                    opacityAnimation: _opacityAnimation,
                    transformAnimation: _transformAnimation,
                  ),
                  CustomTile(
                    icon: Icons.devices_outlined,
                    title: 'Responsive',
                    descrption:
                        'My layouts will work on any device, big or small.',
                    opacityAnimation: _opacityAnimation,
                    transformAnimation: _transformAnimation,
                  ),
                  CustomTile(
                    icon: Icons.dynamic_form,
                    title: 'Dynamic',
                    descrption:
                        'Web/Apps don\'t have to be static, I love making them come to life.',
                    opacityAnimation: _opacityAnimation,
                    transformAnimation: _transformAnimation,
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            SlideTransition(
              position: _slideAnimation!,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Wrap(
                  children: [
                    ProfileSection(widget: widget),
                    SizedBox(width: 36),
                    SlideTransition(
                      position: _slideAnimation3!,
                      child: Column(
                        children: [
                          PercentageTile(
                              title: 'Flutter',
                              percent: 90,
                              getWidth: getWidth),
                          PercentageTile(
                              title: 'Dart', percent: 90, getWidth: getWidth),
                          PercentageTile(
                              title: 'FireBase',
                              percent: 80,
                              getWidth: getWidth),
                          PercentageTile(
                              title: 'HTTP and REST',
                              percent: 80,
                              getWidth: getWidth),
                          PercentageTile(
                              title: 'Git and GitHub',
                              percent: 75,
                              getWidth: getWidth),
                          PercentageTile(
                              title: 'NoSQL databases',
                              percent: 65,
                              getWidth: getWidth),
                          PercentageTile(
                              title: 'Animation',
                              percent: 70,
                              getWidth: getWidth),
                          PercentageTile(
                              title: 'UI Design',
                              percent: 50,
                              getWidth: getWidth),
                          PercentageTile(
                              title: 'Photoshop',
                              percent: 55,
                              getWidth: getWidth),
                          PercentageTile(
                              title: 'Sketch', percent: 50, getWidth: getWidth),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
