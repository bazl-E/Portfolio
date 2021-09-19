import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:basil_personal_web/widgets/project%20screen/project_tile.dart';
import 'package:basil_personal_web/widgets/project%20screen/title_section.dart';
import 'package:basil_personal_web/providers/project_screen_manage.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProjectScreen extends StatefulWidget {
  ProjectScreen({Key? key, this.height}) : super(key: key);
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
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/6.jpg',
    'assets/7.jpg',
    'assets/8.jpg',
    'assets/9.jpg',
  ];

  final List titles = [
    'ALL PROJECTS',
    'FLUTTER',
    'FLUTTER&FIREBASE',
    'FLUTTER WEB',
  ];
  final Map<String, String> subTiltles = {
    'ChowNow Ordering': 'React JS / Python',
    'ChowNow Discover': 'React JS / Python',
    'New Relic': 'React / Ruby on Rails / AEM',
    'Roambi': 'JavaScript',
    'Walker Tracker': 'JS / Ruby on Rails',
    'MY STAND': 'JS / Node.js on Sails',
    'NEVER SURRENDER': 'JavaScript',
    'Powur': 'Angular / Ruby on Rails',
    'The Mall': 'React.js / Node',
  };

  Size sizeGetter(int i) {
    final listLenght = Provider.of<ProjectcreenManager>(context).listLenght;
    if (listLenght == 9) {
      return Size(390, 300);
    } else if ((listLenght == 2 && i == 4) || (listLenght == 2 && i == 7)) {
      return Size(390, 300);
    } else if (listLenght == 3 && (i == 0 || i == 1 || i == 2)) {
      return Size(390, 300);
    } else if (listLenght == 4 && (i == 3 || i == 5 || i == 6 || i == 8)) {
      return Size(390, 300);
    }
    return Size(0, 0);
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
          vsync: this, duration: Duration(milliseconds: 500)));
      topAnimations.add(Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
          .animate(CurvedAnimation(
              parent: controllers[i], curve: Curves.fastOutSlowIn)));
      bottomAnimations.add(
          Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0)).animate(
              CurvedAnimation(
                  parent: controllers[i], curve: Curves.fastOutSlowIn)));
      slideAnimationControllers.add(
          AnimationController(vsync: this, duration: Duration(seconds: 2)));

      slideAnimations.add(Tween<Offset>(
              begin: Offset(0, (i.toDouble() + 1) / 5), end: Offset(0, 0))
          .animate(CurvedAnimation(
              parent: slideAnimationControllers[i],
              curve: Curves.easeInOutQuint)));
    }

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _controller2 =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _slideAnimation = Tween<Offset>(begin: Offset(30, 0), end: Offset(0, 0))
        .animate(
            CurvedAnimation(parent: _controller!, curve: Curves.fastOutSlowIn));
    _slideAnimation2 = Tween<Offset>(begin: Offset(30, 0), end: Offset(0, 0))
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
      key: ValueKey('ProjectScreenKey'),
      onVisibilityChanged: (vi) {
        if (vi.visibleFraction * 100 > 70 && manage.isFrist) {
          for (var i = 0; i < 9; i++) {
            slideAnimationControllers[i].forward();
          }
          _controller!.forward();
          _controller2!.forward().whenComplete(
                () => falManage.setisFrist(false),
              );
        }
      },
      child: Container(
        color: Color(0xfff5f5f5),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 50, bottom: 10),
              child: SlideTransition(
                position: _slideAnimation!,
                child: Text(
                  'PROJECTS',
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
            SizedBox(
              height: 40,
            ),
            TitleSection(manage: manage, titles: titles),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 600),
                width: 1170,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    for (var i = 0; i < 9; i++)
                      InkWell(
                        onTap: () {},
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
                            position: slideAnimations[i],
                            child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                width: sizeGetter(i).width,
                                height: sizeGetter(i).height,
                                curve: Curves.fastOutSlowIn,
                                child: ProjectTile(
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
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
