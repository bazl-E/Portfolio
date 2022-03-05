import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:basil_personal_web/widgets/project%20screen/project_tile.dart';
import 'package:basil_personal_web/widgets/project%20screen/title_section.dart';
import 'package:basil_personal_web/providers/project_screen_manage.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key, this.height}) : super(key: key);
  final double? height;

  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen>
    with TickerProviderStateMixin {
  // bool isFrist = true;

  AnimationController? _controller;
  AnimationController? _controller2;

  Animation<Offset>? _slideAnimation;
  Animation<Offset>? _slideAnimation2;

  List<AnimationController> controllers = [];
  List<AnimationController> slideAnimationControllers = [];
  List<AnimationController> contslideAnimationControllers = [];

  List<Animation<Offset>> topAnimations = [];
  List<Animation<Offset>> bottomAnimations = [];
  List<Animation<Offset>> slideAnimations = [];
  List<Animation<double>> sizeAnimations = [];

  final List<String> images = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.jpg',
    'assets/6.png',
    'assets/7.png',
    'assets/8.png',
    'assets/9.png',
  ];

  final List titles = [
    'ALL PROJECTS',
    'FLUTTER',
    'FLUTTER&FIREBASE',
    'FLUTTER WEB',
  ];
  final Map<String, String> subTiltles = {
    'Ebook-billing': 'Flutter / Firebase',
    'Connect': 'Flutter / Firebase',
    'Billing': 'Flutter / Firebase',
    'Shoppy': 'Flutter',
    'Portfolio': 'Flutter/Web',
    'Personal Expenses': 'Flutter',
    'ToDo': 'Flutter',
    'LinkTree': 'Flutter/Web',
    'Learn Local Notification': 'Flutter/Dart',
  };

  Size sizeGetter(int i, Size size) {
    final listLenght = Provider.of<ProjectcreenManager>(context).listLenght;
    if (listLenght == 9) {
      return size
          //  Size(390, 300)
          ;
    } else if ((listLenght == 4 && i == 4) || (listLenght == 4 && i == 7)) {
      return size
          // Size(390, 300)
          ;
    } else if (listLenght == 3 && (i == 0 || i == 1 || i == 2)) {
      return size
          // Size(390, 300)
          ;
    } else if (listLenght == 2 && (i == 3 || i == 5 || i == 6 || i == 8)) {
      return size
          // Size(390, 300)
          ;
    }
    return const Size(0, 0);
  }

  // void playAnimations() {
  //   for (var n = 0; n < 9; n++) {
  //     slideAnimationControllers[n].forward();
  //   }
  // }

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 9; i++) {
      controllers.add(AnimationController(
          vsync: this, duration: const Duration(milliseconds: 250)));
      topAnimations.add(
          Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(CurvedAnimation(
                  parent: controllers[i], curve: Curves.fastOutSlowIn)));
      bottomAnimations.add(
          Tween<Offset>(begin: const Offset(0, -1), end: const Offset(0, 0))
              .animate(CurvedAnimation(
                  parent: controllers[i], curve: Curves.fastOutSlowIn)));
      slideAnimationControllers.add(AnimationController(
          vsync: this, duration: const Duration(seconds: 2)));

      slideAnimations.add(Tween<Offset>(
              begin: Offset(0, (i.toDouble() + 1) / 5), end: const Offset(0, 0))
          .animate(CurvedAnimation(
              parent: slideAnimationControllers[i],
              curve: Curves.easeInOutQuint)));
    }

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _controller2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _slideAnimation = Tween<Offset>(
            begin: const Offset(30, 0), end: const Offset(0, 0))
        .animate(
            CurvedAnimation(parent: _controller!, curve: Curves.fastOutSlowIn));
    _slideAnimation2 =
        Tween<Offset>(begin: const Offset(30, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: _controller2!, curve: Curves.fastOutSlowIn));

    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {

    // });
  }

  @override
  void dispose() {
    for (var i = 0; i < 9; i++) {
      controllers[i].dispose();
      slideAnimationControllers[i].dispose();
    }
    _controller!.dispose();
    _controller2!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // playAnimations();
    final manage = Provider.of<ProjectcreenManager>(context);
    final falManage = Provider.of<ProjectcreenManager>(context, listen: false);
    if (!manage.isFrist) {
      for (var i = 0; i < 9; i++) {
        slideAnimationControllers[i].forward();
      }
      _controller!.forward();
      _controller2!.forward();
    }

    return VisibilityDetector(
      key: const ValueKey('ProjectScreenKey'),
      onVisibilityChanged: (vi) {
        if (vi.visibleFraction * 100 > 20 && manage.isFrist) {
          for (var i = 0; i < 9; i++) {
            slideAnimationControllers[i].forward();
          }
          _controller!.forward();
          _controller2!.forward().whenComplete(
                () => falManage.setisFrist(false),
              );
        }
      },
      child: ResponsiveBuilder(builder: (ctx, sizeInfo) {
        final double titleSize = sizeInfo.isMobile ? 33.33 : 40;
        final Size projecttileSize = Size(
            sizeInfo.isMobile ? sizeInfo.screenSize.width : 390,
            sizeInfo.isMobile ? 243 : 300);
        return Container(
          key: const ValueKey('aaah'),
          color: const Color(0xfff5f5f5),
          width: MediaQuery.of(context).size.width,
          child: Column(
            key: const ValueKey('aaai'),
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                key: const ValueKey('aaaj'),
                padding: const EdgeInsets.only(top: 50, bottom: 10),
                child: SlideTransition(
                  position: _slideAnimation!,
                  child: Text(
                    'PROJECTS',
                    key: const ValueKey('aaak'),
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w700,
                        fontSize: titleSize,
                        color: const Color(0xff444649)),
                  ),
                ),
              ),
              SlideTransition(
                key: const ValueKey('aaal'),
                position: _slideAnimation2!,
                child: Container(
                  key: const ValueKey('aaam'),
                  width: 70,
                  height: 4,
                  color: const Color(0xff45474a),
                ),
              ),
              SizedBox(
                key: const ValueKey('aaan'),
                height: 3.97.h,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TitleSection(
                  manage: manage,
                  titles: titles,
                  key: const ValueKey('aaao'),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                key: const ValueKey('aaap'),
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  key: const ValueKey('aaaq'),
                  width: min(100.w > 1400 ? 80.9.w : 90.w, 1200),
                  // width: 100.w > 1400 ? 80.9.w : 90.w,
                  child: Wrap(
                    key: const ValueKey('aaar'),
                    alignment: WrapAlignment.center,
                    children: [
                      for (var i = 0; i < 9; i++)
                        InkWell(
                          key: ValueKey('aaas$i'),
                          onTap: () {
                            if (sizeInfo.isMobile) {
                              falManage.setIsHovered(true);
                              falManage.sethoveredIndex(i);
                              controllers[i].forward();
                            }
                          },
                          onHover: (t) {
                            if (t) {
                              falManage.setIsHovered(true);
                              falManage.sethoveredIndex(i);
                              controllers[i].forward();
                            } else {
                              controllers[i].reverse();
                              falManage.setIsHovered(false);
                              falManage.sethoveredIndex(null);
                            }
                          },
                          child: SlideTransition(
                              key: const ValueKey('aaat'),
                              position: slideAnimations[i],
                              child: AnimatedContainer(
                                  key: const ValueKey('aaau'),
                                  duration: const Duration(milliseconds: 500),
                                  width: sizeGetter(i, projecttileSize).width,
                                  height: sizeGetter(i, projecttileSize).height,
                                  curve: Curves.fastOutSlowIn,
                                  child: ProjectTile(
                                    key: const ValueKey('aaav'),
                                    i: i,
                                    images: images,
                                    subTiltles: subTiltles,
                                    topAnimations: topAnimations,
                                    bottomAnimations: bottomAnimations,
                                  ))),
                        ),
                      // ),
                      // ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                key: const ValueKey('aaaw'),
                height: 5.95.h,
              )
            ],
          ),
        );
      }),
    );
  }
}
