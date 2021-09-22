import 'dart:math';
import 'package:basil_personal_web/providers/about_screen_manager.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:basil_personal_web/widgets/about_screen/custom_tile.dart';
import 'package:basil_personal_web/widgets/about_screen/percenteage_tile.dart';
import 'package:basil_personal_web/widgets/about_screen/profile_section.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
  // bool isFrist = true;

  AnimationController? _controller;
  AnimationController? _controller2;
  AnimationController? _controller3;
  AnimationController? _controller4;

  Animation<Offset>? _slideAnimation;
  Animation<Offset>? _slideAnimation2;
  Animation<Offset>? _slideAnimation3;
  Animation<double>? _opacityAnimation;
  Animation<num>? _transformAnimation;

  double getWidth(double percent, BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final widt = min((w * .9), 600).toDouble();
    return width * (widt - 8.5.w) * (percent / 100);
  }

  @override
  void initState() {
    super.initState();
    _controller3 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1).animate(CurvedAnimation(
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
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _slideAnimation2 = Tween<Offset>(begin: Offset(-10.5, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
            parent: _controller2!, curve: Curves.fastOutSlowIn));

    _slideAnimation3 = Tween<Offset>(begin: Offset(30, 0), end: Offset(0, 0))
        .animate(
            CurvedAnimation(parent: _controller!, curve: Curves.fastOutSlowIn));

    // WidgetsBinding.instance!.addPostFrameCallback((_) {

    // });
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
    final manage = Provider.of<AboutscreenManager>(context);
    final falManage = Provider.of<AboutscreenManager>(context, listen: false);
    // _controller!.forward();
    // _controller2!.forward();
    // _controller3!.forward();
    // _controller4!.forward();
    if (!manage.isFrist) {
      _controller!.forward().whenComplete(() {
        setState(() {
          width = 1;
        });
      });
      _controller2!.forward();
      _controller3!.forward();
      _controller4!.forward();
    }
    return ResponsiveBuilder(builder: (ctx, sizeInfo) {
      final double titleSize = sizeInfo.isMobile ? 34 : 40;
      return VisibilityDetector(
        key: ValueKey('AboutScreenKey'),
        onVisibilityChanged: (vi) {
          if (vi.visibleFraction * 100 > 70 && manage.isFrist) {
            _controller!.forward().whenComplete(() {
              setState(() {
                width = 1;
              });
            });
            _controller2!.forward();
            _controller3!.forward();
            _controller4!.forward().whenComplete(
                  () => falManage.setisFrist(false),
                );
          }
        },
        child: FittedBox(
          key: ValueKey('k'),
          fit: BoxFit.scaleDown,
          child: Container(
            key: ValueKey('l'),
            width: MediaQuery.of(context).size.width,
            child: Column(
              key: ValueKey('m'),
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  key: ValueKey('n'),
                  padding: EdgeInsets.only(top: 4.46.h, bottom: 0.99.h),
                  child: SlideTransition(
                    key: ValueKey('o'),
                    position: _slideAnimation!,
                    child: Text(
                      'ABOUT',
                      key: ValueKey('p'),
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w700,
                          fontSize: titleSize,
                          color: Color(0xff444649)),
                    ),
                  ),
                ),
                SlideTransition(
                  key: ValueKey('q'),
                  position: _slideAnimation2!,
                  child: Container(
                    key: ValueKey('r'),
                    width: 71,
                    height: 0.39.h,
                    color: Color(0xff45474a),
                  ),
                ),
                SizedBox(height: 6.h),
                Container(
                  key: ValueKey('s'),
                  child: Wrap(
                    key: ValueKey('t'),
                    alignment: WrapAlignment.spaceAround,
                    spacing: 3.97.h,
                    runSpacing: 3.97.h,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      CustomTile(
                        key: ValueKey('u'),
                        icon: Icons.speed,
                        title: 'Fast',
                        descrption:
                            'Fast load times and lag free interaction, my highest priority.',
                        opacityAnimation: _opacityAnimation,
                        transformAnimation: _transformAnimation,
                      ),
                      CustomTile(
                        key: ValueKey('v'),
                        icon: Icons.lightbulb_outline,
                        title: 'Intuitive',
                        descrption:
                            'Strong preference for easy to use, intuitive UX/UI.',
                        opacityAnimation: _opacityAnimation,
                        transformAnimation: _transformAnimation,
                      ),
                      CustomTile(
                        key: ValueKey('w'),
                        icon: Icons.devices_outlined,
                        title: 'Responsive',
                        descrption:
                            'My layouts will work on any device, big or small.',
                        opacityAnimation: _opacityAnimation,
                        transformAnimation: _transformAnimation,
                      ),
                      CustomTile(
                        key: ValueKey('x'),
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
                SizedBox(
                  height: 3.97.h,
                  key: ValueKey('y'),
                ),
                SlideTransition(
                  key: ValueKey('z'),
                  position: _slideAnimation!,
                  child: Padding(
                    key: ValueKey('aa'),
                    padding: const EdgeInsets.all(20.0),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      key: ValueKey('ab'),
                      children: [
                        ProfileSection(
                          widget: widget,
                          key: ValueKey('ac'),
                        ),
                        SizedBox(
                          width: 1.875.w,
                          key: ValueKey('ad'),
                        ),
                        SlideTransition(
                          key: ValueKey('ae'),
                          position: _slideAnimation3!,
                          child: Column(
                            key: ValueKey('af'),
                            children: [
                              PercentageTile(
                                  key: ValueKey('ag'),
                                  title: 'Flutter',
                                  percent: 90,
                                  getWidth: getWidth),
                              PercentageTile(
                                  key: ValueKey('ah'),
                                  title: 'Dart',
                                  percent: 90,
                                  getWidth: getWidth),
                              PercentageTile(
                                  key: ValueKey('ai'),
                                  title: 'FireBase',
                                  percent: 80,
                                  getWidth: getWidth),
                              PercentageTile(
                                  key: ValueKey('aj'),
                                  title: 'HTTP and REST',
                                  percent: 80,
                                  getWidth: getWidth),
                              PercentageTile(
                                  key: ValueKey('ak'),
                                  title: 'Git and GitHub',
                                  percent: 75,
                                  getWidth: getWidth),
                              PercentageTile(
                                  key: ValueKey('al'),
                                  title: 'NoSQL databases',
                                  percent: 65,
                                  getWidth: getWidth),
                              PercentageTile(
                                  key: ValueKey('am'),
                                  title: 'Animation',
                                  percent: 70,
                                  getWidth: getWidth),
                              PercentageTile(
                                  key: ValueKey('an'),
                                  title: 'UI Design',
                                  percent: 50,
                                  getWidth: getWidth),
                              PercentageTile(
                                  key: ValueKey('ao'),
                                  title: 'Photoshop',
                                  percent: 55,
                                  getWidth: getWidth),
                              PercentageTile(
                                  key: ValueKey('ap'),
                                  title: 'Sketch',
                                  percent: 50,
                                  getWidth: getWidth),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.w,
                  key: ValueKey('aq'),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
