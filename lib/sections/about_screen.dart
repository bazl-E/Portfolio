// import 'package:basil_personal_web/helper/my_clip.dart';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:polygon_clipper/polygon_clipper.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key? key, this.height, this.scroll}) : super(key: key);
  final double? height;
  final Future Function(int index)? scroll;

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  AnimationController? _controller2;
  AnimationController? _controller3;

  AnimationController? _controller4;

  Animation<Offset>? _slideAnimation;
  Animation<Offset>? _slideAnimation2;
  Animation<Offset>? _slideAnimation3;
  Animation<num>? _opacityAnimation;
  Animation<num>? _transformAnimation;
  double width = 0;
  bool init = true;

  double getWidth(double percent) {
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
      print("WidgetsBinding");
      _controller!.forward();
      _controller2!.forward();
      _controller3!.forward();
      _controller4!.forward();
    });
    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          width = 1;
        });
      }
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

  Widget buildPersentTile({String? title, double? persent}) {
    final w = MediaQuery.of(context).size.width;
    final widt = min((w * .9), 600).toDouble();

    return Container(
      margin: EdgeInsets.only(top: 6, bottom: 6, left: 6),
      width: widt,
      color: Color(0xffeeeeee),
      height: 31,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 31,
                width: 150,
                color: Color(0xff05c2c9),
                child: Center(
                  child: Text(title!,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              AnimatedContainer(
                duration: Duration(seconds: 1),
                width: getWidth(persent!),
                height: 31,
                color: Color(0xff01a1a7),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${persent.toString()}%',
                style: GoogleFonts.raleway(
                  fontSize: 14,
                  color: Color(0xff8d8d8d),
                )),
          )
        ],
      ),
    );
  }

  Widget buildCustomTile({IconData? icon, String? title, String? descrption}) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              // AnimatedContainer(
              //   duration: Duration(seconds: 3),
              //   alignment: Alignment.center,
              // transform: Matrix4.identity()
              //   ..setEntry(3, 2, 0.001)
              //   ..rotateY(pi * _transformAnimation!.value.toDouble()),
              // child:
              // Transform(
              //   transform: Matrix4.identity()
              //     ..setEntry(3, 2, 0.001)
              //     ..rotateY(pi * _transformAnimation!.value.toDouble()),
              //   child:
              AnimatedContainer(
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
              // ),
              // ),
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
              child: AnimatedOpacity(
                opacity: _opacityAnimation!.value.toDouble(),
                duration: Duration(seconds: 2),
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
              child: AnimatedOpacity(
                duration: Duration(seconds: 2),
                opacity: _opacityAnimation!.value.toDouble(),
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

  @override
  Widget build(BuildContext context) {
    // _controller!.forward();
    // _controller2!.forward();
    // _controller3!.forward();
    // _controller4!.forward();
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        // height: min(widget.height!, double.infinity),
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
              // width: min(1200, MediaQuery.of(context).size.width),
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                spacing: 40,
                runSpacing: 40,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  buildCustomTile(
                    icon: Icons.speed,
                    title: 'Fast',
                    descrption:
                        'Fast load times and lag free interaction, my highest priority.',
                  ),
                  buildCustomTile(
                    icon: Icons.lightbulb_outline,
                    title: 'Intuitive',
                    descrption:
                        'Strong preference for easy to use, intuitive UX/UI.',
                  ),
                  buildCustomTile(
                    icon: Icons.devices_outlined,
                    title: 'Responsive',
                    descrption:
                        'My layouts will work on any device, big or small.',
                  ),
                  buildCustomTile(
                    icon: Icons.dynamic_form,
                    title: 'Dynamic',
                    descrption:
                        'Web/Apps don\'t have to be static, I love making them come to life.',
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/prof.png',
                          height: 300,
                          width: 300,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Container(
                            child: Text(
                              'Who\'s this guy?',
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Color(0xff666361)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Column(
                            children: [
                              Container(
                                width: 500,
                                child: Text(
                                  "I'm a freelancing Developer from Kerala,Inida.I have serious passion for UI effects, animations and creating intuitive, dynamic user experiences.",
                                  style: GoogleFonts.raleway(
                                      fontSize: 16, color: Color(0xff616161)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  widget.scroll!(4);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    'Let\'s make something special.',
                                    style: GoogleFonts.raleway(
                                        fontSize: 16, color: Color(0xff039bda)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 36),
                    SlideTransition(
                      position: _slideAnimation3!,
                      child: Column(
                        children: [
                          buildPersentTile(title: 'Flutter', persent: 90),
                          buildPersentTile(title: 'Dart', persent: 90),
                          buildPersentTile(title: 'FireBase', persent: 80),
                          buildPersentTile(title: 'HTTP and REST', persent: 80),
                          buildPersentTile(
                              title: 'Git and GitHub', persent: 50),
                          buildPersentTile(
                              title: 'NoSQL databases', persent: 75),
                          buildPersentTile(title: 'Animation', persent: 70),
                          buildPersentTile(title: 'UI Design', persent: 50),
                          buildPersentTile(title: 'Photoshop', persent: 55),
                          buildPersentTile(title: 'Sketch', persent: 50),
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
