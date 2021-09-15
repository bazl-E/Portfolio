import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectScreen extends StatefulWidget {
  ProjectScreen({Key? key, this.height}) : super(key: key);
  final double? height;

  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen>
    with TickerProviderStateMixin {
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
  // List<Animation<Size>> contsizeanime = [];

  bool isHovered = false;
  int? hoveredIndex;
  bool buttonHovered = false;
  var listLenght = 9;

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

      // sizeAnimations.add(Tween<double>(begin: 0, end: 1).animate(
      //     CurvedAnimation(
      //         parent: slideAnimationControllers[i],
      //         curve: Curves.fastOutSlowIn)));

      // contsizeanime.add(Tween<Size>(begin: Size(0, 0), end: Size(390, 300))
      //     .animate(CurvedAnimation(
      //         parent: slideAnimationControllers[i],
      //         curve: Curves.fastOutSlowIn)));
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

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _controller!.forward();
      _controller2!.forward();
    });
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

  int length(int i) {
    if (i == 0) {
      return 9;
    }
    if (i == 1) {
      return 2;
    }
    if (i == 2) {
      return 3;
    }

    return 4;
  }

  Widget buildTitle(String text, int i, Color color) {
    return LayoutBuilder(
        builder: (ctx, constain) => InkWell(
              onTap: () {
                setState(() {
                  index = i;
                  listLenght = length(i);
                  // maxwidth = constain.maxWidth;
                });

                // for (var n = 0; n < listLenght; n++) {
                //   slideAnimationControllers[n].repeat();
                // }
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                width: 200,
                height: 33,
                child: Center(
                    child: AnimatedDefaultTextStyle(
                        child: Text(text),
                        style: GoogleFonts.raleway(
                            fontSize: 18,
                            color: color,
                            fontWeight: FontWeight.w600),
                        duration: Duration(milliseconds: 600))),
              ),
            ));
  }

  int? index = 0;
  int? selectedButton;
  double? maxwidth = 0;
  final List<String> flutter = [
    'assets/5.jpg',
    'assets/8.jpg',
  ];
  final List<String> flutterFirebase = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
  ];
  final List<String> flutterWeb = [
    'assets/4.jpg',
    'assets/6.jpg',
    'assets/7.jpg',
    'assets/9.jpg',
  ];
  final List<String> all = [
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
  final Map subTiltles = {
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

  Alignment alignementGetter(int i) {
    final al = i.toDouble();
    if (listLenght == 9) {
      return Alignment(-1, -1);
    } else if ((listLenght == 2 && i == 4) || (listLenght == 2 && i == 7)) {
      return Alignment(al, 0);
    } else if (listLenght == 3 && (i == 0 || i == 1 || i == 2)) {
      return Alignment(al, 0);
    } else if (listLenght == 4 && (i == 3 || i == 5 || i == 6 || i == 8)) {
      return Alignment(al, 0);
    }
    return Alignment(0, 0);
  }

  void plaAnimations() {
    // for (i = 0; i < 9; i++) {
    //   slideAnimationControllers[i].addStatusListener((status) {
    //     if (status == AnimationStatus.completed && i < 9) {
    //       slideAnimationControllers[i + 1].forward();
    //       i = i + 2;
    //     }
    //   });
    // }
    for (var n = 0; n < 9; n++) {
      slideAnimationControllers[n].forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    plaAnimations();
    // _controller!.forward();
    // _controller2!.forward();
    return Container(
      color: Color(0xfff5f5f5),
      // height: min(widget.height!, double.infinity),
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
          FittedBox(
            fit: BoxFit.scaleDown,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) =>
                  Stack(
                children: [
                  AnimatedPositioned(
                      bottom: 0,
                      top: 0,
                      left: index! * 212.5,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 50),
                        width: 200,
                        height: 30,
                        color: Colors.pink,
                      ),
                      duration: Duration(milliseconds: 200)),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (var i = 0; i < 4; i++)
                          //   SlideTransition(
                          //     position: slideAnimations[i],
                          //     child:
                          buildTitle(
                            titles[i],
                            i,
                            i == index ? Colors.white : Color(0xff626262),
                          ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 600),
              width: 1170,
              child: Wrap(
                alignment: WrapAlignment.center,
                // crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  for (var i = 0; i < 9; i++)
                    // AnimatedPositioned(
                    // width: sizeGetter(i).width,
                    // height: sizeGetter(i).height,
                    // duration: Duration(milliseconds: 500),
                    // child:
                    InkWell(
                      onTap: () {},
                      onHover: (t) {
                        if (t) {
                          print('Hovered');
                          setState(() {
                            isHovered = true;
                            hoveredIndex = i;
                            controllers[i].forward();
                          });
                        } else {
                          setState(() {
                            controllers[i].reverse();

                            isHovered = false;
                            hoveredIndex = null;
                          });
                        }
                      },
                      child: SlideTransition(
                        position: slideAnimations[i],
                        child:
                            //  AnimatedAlign(
                            //   duration: Duration(milliseconds: 500),
                            //   alignment: alignementGetter(i),
                            //   child:
                            AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          width: sizeGetter(i).width,
                          height: sizeGetter(i).height,
                          curve: Curves.fastOutSlowIn,
                          child: Stack(
                            children: [
                              Container(
                                width: 390,
                                height: 300,
                                child: Image.asset(
                                  all[i],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // ),
                              // if (isHovered && (i == hoveredIndex))
                              AnimatedOpacity(
                                opacity:
                                    (isHovered && (i == hoveredIndex)) ? 1 : 0,
                                duration: Duration(milliseconds: 100),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  // width: contsizeanime[i].value.width,
                                  // height: contsizeanime[i].value.height,
                                  // width: sizeGetter(i).width,
                                  // height: sizeGetter(i).height,
                                  // duration: Duration(seconds: 1),
                                  width: 390,
                                  height: 300,
                                  child: Column(
                                    // mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SlideTransition(
                                        position: bottomAnimations[i],
                                        child: Column(
                                          children: [
                                            Text(
                                              subTiltles.keys.toList()[i],
                                              style: GoogleFonts.raleway(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 21.3,
                                                color: Color(0xff1b242f),
                                              ),
                                            ),
                                            Text(
                                              subTiltles.values.toList()[i],
                                              style: GoogleFonts.raleway(
                                                fontSize: 16,
                                                color: Color(0xffe31b6d),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SlideTransition(
                                        position: topAnimations[i],
                                        child: InkWell(
                                          onTap: () {
                                            // setState(() {
                                            //   buttonHovered = true;
                                            // });
                                          },
                                          onHover: (t) {
                                            if (t) {
                                              setState(() {
                                                buttonHovered = true;
                                              });
                                            } else {
                                              setState(() {
                                                buttonHovered = false;
                                              });
                                            }
                                          },
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 200),
                                            width: 170,
                                            decoration: BoxDecoration(
                                                color: (buttonHovered &&
                                                        hoveredIndex == i)
                                                    ? Color(0xffe31c6e)
                                                    : null,
                                                border: Border.all(
                                                    color: Colors.pink,
                                                    width: 2)),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 10),
                                            child: Center(
                                              child: Text(
                                                'LEARN MORE',
                                                style: GoogleFonts.raleway(
                                                  fontSize: 17.3,
                                                  color: (buttonHovered &&
                                                          hoveredIndex == i)
                                                      ? Colors.white
                                                      : Color(0xff1b242f),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  color: Color(0xfff5f5f5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
    );
  }
}
