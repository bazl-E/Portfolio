import 'dart:math';

import 'package:basil_personal_web/helper/firebaseconnect.dart';
import 'package:basil_personal_web/sections/welcome_page.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactScreen extends StatefulWidget {
  ContactScreen({Key? key, this.height, this.gotoHome}) : super(key: key);
  final double? height;
  final VoidCallback? gotoHome;

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  // Color? color = Colors.transparent;
  // Color? borderColor = Colors.white;

  bool isHovered = false;
  bool socialHovered = false;
  double intialpostion = 0;
  Color hovercolor = Colors.pink;

  double width = 0;
  double height = 0;

  bool isSaving = false;
  double opacity = 1;
  int? hoveredindex;
  String? name = '';
  String? email = '';
  String? message = '';
  List<AnimationController> controllers = [];
  List<Animation<Offset>> animations = [];
  List<Animation<Offset>> animations2 = [];
  AnimationController? leftanimaController;
  AnimationController? rightanimaController;
  AnimationController? rightanimaController2;
  Animation<Offset>? leftanimae;
  Animation<Offset>? rightanimae;
  Animation<Offset>? right2animae;

  void launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 5; i++) {
      controllers.add(AnimationController(
          vsync: this, duration: Duration(milliseconds: 1000)));
      animations.add(
        Tween<Offset>(begin: Offset(0, -1), end: Offset(0, .9)).animate(
          CurvedAnimation(
              parent: controllers[i], curve: Curves.fastLinearToSlowEaseIn),
        ),
      );
      animations2.add(
        Tween<Offset>(begin: Offset(0, -.2), end: Offset(0, 2)).animate(
          CurvedAnimation(
              parent: controllers[i], curve: Curves.fastLinearToSlowEaseIn),
        ),
      );
    }
    leftanimaController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    leftanimae = Tween<Offset>(begin: Offset(-30, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
            parent: leftanimaController!,
            curve: Curves.fastLinearToSlowEaseIn));
    rightanimae = Tween<Offset>(begin: Offset(40, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
            parent: leftanimaController!,
            curve: Curves.fastLinearToSlowEaseIn));

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      leftanimaController!.forward();
      setState(() {
        height = 350;
        width = 500;
      });
    });
  }

  void onSave() async {
    _formKey.currentState!.save();
    if (name!.isEmpty || email!.isEmpty || message!.isEmpty) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Please fill all the fields',
            textAlign: TextAlign.center,
          ),
          dismissDirection: DismissDirection.endToStart,
          backgroundColor: Colors.red));
      return;
    }
    if (!email!.contains('@')) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Provide a valid email',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red,
        dismissDirection: DismissDirection.endToStart,
      ));
      return;
    }
    setState(() {
      isSaving = true;
    });
    print(name);
    print(email);
    print(message);
    await Messages.publish(name!, email!, message!);

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'I got your message,i\'ll respond back as soon as possible',
        textAlign: TextAlign.center,
      ),
      backgroundColor: Color(0xffe31b6d),
      dismissDirection: DismissDirection.endToStart,
    ));
    setState(() {
      isSaving = false;
    });
    print('submitted successfully');
    name = '';
    email = '';
    message = '';
    _formKey.currentState!.reset();
  }

  Widget buildanimatedSocial({String? image, int? index, String? url}) {
    return InkWell(
      onTap: () {
        launchURL(url);
      },
      onHover: (t) {
        if (t) {
          setState(() {
            intialpostion = 1.0;
            opacity = 0;
            socialHovered = true;
            hoveredindex = index;
            controllers[index!].forward();

            // .then((value) => controllers[index].reverse());
          });
        } else {
          setState(() {
            socialHovered = false;
            hoveredindex = null;
            controllers[index!].reset();
          });
        }
      },
      child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.only(left: 17, right: 17),
          color: (socialHovered && hoveredindex == index)
              ? Color(0xff05c2c9)
              : Color(0xff262f38),
          width: (socialHovered && hoveredindex == index) ? 53 : 55,
          height: (socialHovered && hoveredindex == index) ? 53 : 55,
          child:
              //  SlideTransition(
              //     position: animations2[index!],
              //     child:
              Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SlideTransition(
                position: animations[index!],
                child: Opacity(
                  // duration: Duration(milliseconds: 100),
                  opacity: (socialHovered && hoveredindex == index) ? 1 : 0
                  // 1
                  ,
                  child: Image.asset(
                    image!,
                    color: Colors.white,
                  ),
                ),
              ),
              SlideTransition(
                position: animations2[index],
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 100),
                  opacity: (socialHovered && hoveredindex == index) ? 0 : 1
                  // 1
                  ,
                  child: Image.asset(
                    image,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
            // )
          )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (var i = 0; i < 5; i++) {
      controllers[i].dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff252934),
      child: Container(
        height: widget.height,
        child: Flex(direction: Axis.vertical, children: [
          Flexible(
            flex: 10,
            child: Container(
              color: Color(0xff252934),
              height: min(widget.height!, double.infinity),
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SlideTransition(
                      position: leftanimae!,
                      child: Container(
                        padding: EdgeInsets.only(top: 50, bottom: 10),
                        child: Text(
                          'CONTACT',
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w700,
                              fontSize: 44,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: rightanimae!,
                      child: Container(
                        width: 70,
                        height: 4,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 50),
                    SlideTransition(
                      position: rightanimae!,
                      child: Text('Have a question or want to work together?',
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xff07b0b7))),
                    ),
                    SizedBox(height: 50),
                    AnimatedContainer(
                      // color: Colors.amber,
                      duration: Duration(seconds: 2),
                      curve: Curves.bounceInOut,
                      width: width,
                      height: height,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(5),
                                height: 40,
                                width: 500,
                                color: Color(0xff1e242c),
                                child: TextFormField(
                                  onSaved: (val) {
                                    name = val;
                                  },
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    // contentPadding: EdgeInsets.only(bottom: 10),
                                    hintText: "Name",
                                    hintStyle:
                                        TextStyle(color: Color(0xff6b6b6c)),
                                  ),
                                )),
                            Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(5),
                                height: 40,
                                width: 500,
                                color: Color(0xff1e242c),
                                child: TextFormField(
                                  onSaved: (val) {
                                    email = val;
                                  },
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    // contentPadding: EdgeInsets.only(bottom: 10),
                                    hintText: "Enter email",
                                    hintStyle:
                                        TextStyle(color: Color(0xff6b6b6c)),
                                  ),
                                )),
                            Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(5),
                                color: Color(0xff1e242c),
                                height: 150,
                                width: 500,
                                child: TextFormField(
                                  onSaved: (val) {
                                    message = val;
                                  },
                                  // maxLength: 250,
                                  maxLines: 10,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    // contentPadding: EdgeInsets.all(7),
                                    hintText: "Your Message",
                                    hintStyle:
                                        TextStyle(color: Color(0xff6b6b6c)),
                                  ),
                                )),
                            InkWell(
                              onTap: () {},
                              onHover: (t) {
                                if (t) {
                                  setState(() {
                                    isHovered = true;
                                  });
                                } else {
                                  setState(() {
                                    isHovered = false;
                                  });
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: isHovered
                                        ? Color(0xff04c2c9)
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: isHovered
                                          ? Color(0xff04c2c9)
                                          : Colors.white,
                                    )),
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                child: TextButton(
                                  onPressed: isSaving ? null : onSave,
                                  child: Text(
                                    'SUBMIT',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
              flex: 3,
              child: Container(
                height: double.infinity,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildanimatedSocial(
                                image: 'assets/11.png',
                                index: 0,
                                url: 'https://github.com/bazl-E'),
                            SizedBox(width: 30),
                            buildanimatedSocial(
                                image: 'assets/12.png',
                                index: 1,
                                url:
                                    'https://www.linkedin.com/mwlite/in/muhammed-basil-0a2b691b2'),
                            SizedBox(width: 30),
                            buildanimatedSocial(
                                image: 'assets/13.png',
                                index: 2,
                                url:
                                    'https://www.facebook.com/profile.php?id=100005176755893'),
                            SizedBox(width: 30),
                            buildanimatedSocial(
                                image: 'assets/14.png',
                                index: 3,
                                url: 'https://twitter.com/MhdBasil_E'),
                            SizedBox(width: 30),
                            buildanimatedSocial(
                                image: 'assets/15.png',
                                index: 4,
                                url: 'https://linktree-cb3f3.firebaseapp.com/'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Muhammed Basil E',
                              style: GoogleFonts.raleway(
                                  color: Color(0xff515a66), fontSize: 14),
                            ),
                            SizedBox(width: 3),
                            Text(
                              '©2021',
                              style: GoogleFonts.raleway(
                                  color: Colors.pink, fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                    Positioned(
                      top: -30,
                      left: (MediaQuery.of(context).size.width / 2) - 25,
                      child: InkWell(
                        onHover: (t) {
                          if (t) {
                            setState(() {
                              hovercolor = Colors.pinkAccent;
                            });
                          } else {
                            setState(() {
                              hovercolor = Colors.pink;
                            });
                          }
                        },
                        onTap: widget.gotoHome,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 350),
                          color: hovercolor,
                          width: 50,
                          height: 55,
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: Icon(
                              Icons.double_arrow,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                color: Color(0xff1b242f),
              ))
        ]),
      ),
    );
  }
}
