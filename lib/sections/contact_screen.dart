import 'dart:math';

import 'package:basil_personal_web/helper/firebaseconnect.dart';
import 'package:basil_personal_web/providers/contact_screen_manager.dart';
// import 'package:basil_personal_web/widgets/contact%20screen/home_button.dart';
// import 'package:basil_personal_web/widgets/contact%20screen/social_button.dart';
import 'package:basil_personal_web/widgets/contact%20screen/social_button_row.dart';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
  // bool isFrist = true;

  double width = 0;
  double height = 0;

  String? name = '';
  String? email = '';
  String? message = '';

  Animation<Offset>? leftanimae;
  Animation<Offset>? rightanimae;
  Animation<Offset>? right2animae;

  List<Animation<Offset>> animations = [];
  List<Animation<Offset>> animations2 = [];

  List<AnimationController> controllers = [];

  AnimationController? leftanimaController;

  void showToast(String message) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM_LEFT,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.pink,
      textColor: Colors.white,
      webPosition: "left",
      webShowClose: true,
      webBgColor: "linear-gradient(to right, #04C2C9, #5C7B9A)",
      fontSize: 16.0);

  void onSave() async {
    final falmanage = Provider.of<ContactscreenManager>(context, listen: false);
    _formKey.currentState!.save();
    if (name!.isEmpty || email!.isEmpty || message!.isEmpty) {
      showToast('Please fill all the fields');
      return;
    }
    if (!email!.contains('@')) {
      showToast('Provide a valid email');
      return;
    }
    falmanage.setisFormSaving(true);

    print(name);
    print(email);
    print(message);
    await Messages.publish(name!, email!, message!);

    showToast('I got your message,I\'ll respond back as soon as possible');
    falmanage.setisFormSaving(false);

    print('submitted successfully');
    name = '';
    email = '';
    message = '';
    _formKey.currentState!.reset();
  }

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

    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {

    // });
  }

  @override
  void dispose() {
    for (var i = 0; i < 5; i++) {
      controllers[i].dispose();
    }
    leftanimaController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final falmanage = Provider.of<ContactscreenManager>(context, listen: false);
    final manage = Provider.of<ContactscreenManager>(context);
    if (!manage.isFrist) {
      leftanimaController!.forward();
      setState(() {
        height = 350;
        width = 500;
      });
      setState(() {
        height = 350;
        width = 500;
      });
    }

    return ResponsiveBuilder(builder: (ctx, sizeInfo) {
      // final Size contactSize = Size(26.04.w, 18.22.h);

      final double titleSize = sizeInfo.isMobile ? 30 : 40;
      final double subTitleSize = sizeInfo.isMobile ? 12 : 16;
      final double contactcontainerWidth = min(500, sizeInfo.screenSize.width);

      return VisibilityDetector(
        key: ValueKey('ContactScreenKey'),
        onVisibilityChanged: (vi) {
          if (vi.visibleFraction * 100 > 40 && manage.isFrist) {
            leftanimaController!.forward();
            setState(() {
              height = 350;
              width = 500;
            });
            falmanage.setisFrist(false);
          }
        },
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: sizeInfo.screenSize.height - kToolbarHeight,
            maxHeight: double.infinity,
          ),
          child: Container(
            key: ValueKey('aaf'),
            color: Color(0xff1b242f),
            child: Container(
              key: ValueKey('aag'),
              // height: widget.height,
              child:
                  //  Flex(direction: Axis.vertical, children: [
                  //   Flexible(
                  //     key: ValueKey('aah'),
                  //     flex: 10,
                  //     child:
                  Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    key: ValueKey('aai'),
                    color: Color(0xff252934),
                    height: 720,
                    // height: min(widget.height!, double.infinity),
                    width: MediaQuery.of(context).size.width,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        key: ValueKey('aaj'),
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SlideTransition(
                            key: ValueKey('aak'),
                            position: leftanimae!,
                            child: Container(
                              key: ValueKey('aal'),
                              padding: EdgeInsets.only(top: 50, bottom: 10),
                              child: Text(
                                'CONTACT',
                                key: ValueKey('aam'),
                                style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w700,
                                    fontSize: titleSize,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SlideTransition(
                            key: ValueKey('aan'),
                            position: rightanimae!,
                            child: Container(
                              key: ValueKey('aao'),
                              width: 70,
                              height: 4,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            key: ValueKey('aap'),
                          ),
                          SlideTransition(
                            key: ValueKey('aaq'),
                            position: rightanimae!,
                            child: Text(
                                'Have a question or want to work together?',
                                key: ValueKey('aar'),
                                style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w700,
                                    fontSize: subTitleSize,
                                    color: Color(0xff07b0b7))),
                          ),
                          SizedBox(
                            height: 50,
                            key: ValueKey('aas'),
                          ),
                          AnimatedContainer(
                            key: ValueKey('aat'),
                            // color: Colors.amber,
                            duration: Duration(seconds: 2),
                            curve: Curves.bounceInOut,
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            width: width,
                            height: height,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Column(
                                key: ValueKey('aav'),
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                      key: ValueKey('aaw'),
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.all(5),
                                      height: 40,
                                      width: contactcontainerWidth,
                                      color: Color(0xff1e242c),
                                      child: TextFormField(
                                        key: ValueKey('aax'),
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
                                          hintStyle: TextStyle(
                                              color: Color(0xff6b6b6c)),
                                        ),
                                      )),
                                  Container(
                                      key: ValueKey('aay'),
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.all(5),
                                      height: 40,
                                      width: contactcontainerWidth,
                                      color: Color(0xff1e242c),
                                      child: TextFormField(
                                        key: ValueKey('aaz'),
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
                                          hintStyle: TextStyle(
                                              color: Color(0xff6b6b6c)),
                                        ),
                                      )),
                                  Container(
                                      key: ValueKey('aaaa'),
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.all(5),
                                      color: Color(0xff1e242c),
                                      height: 150,
                                      width: contactcontainerWidth,
                                      child: TextFormField(
                                        key: ValueKey('aaab'),
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
                                          hintStyle: TextStyle(
                                              color: Color(0xff6b6b6c)),
                                        ),
                                      )),
                                  InkWell(
                                    key: ValueKey('aaac'),
                                    onTap: () {},
                                    onHover: (t) {
                                      if (t) {
                                        falmanage.setisSubmitHovered(true);
                                      } else {
                                        falmanage.setisSubmitHovered(false);
                                      }
                                    },
                                    child: Container(
                                      key: ValueKey('aaad'),
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: manage.isSubmitHovered
                                              ? Color(0xff04c2c9)
                                              : Colors.transparent,
                                          border: Border.all(
                                            color: manage.isSubmitHovered
                                                ? Color(0xff04c2c9)
                                                : Colors.white,
                                          )),
                                      padding: EdgeInsets.symmetric(
                                          vertical: sizeInfo.isMobile ? 0 : 5,
                                          horizontal: 20),
                                      child: TextButton(
                                        key: ValueKey('aaae'),
                                        onPressed:
                                            manage.isFormSaving ? null : onSave,
                                        child: Text(
                                          'SUBMIT',
                                          key: ValueKey('aaaf'),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
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
                  // Expanded(
                  //   child:
                  Container(
                    height: 210,
                    child: SocialButtonRow(
                      key: ValueKey('aaag'),
                      animations2: animations2,
                      animations: animations,
                      controllers: controllers,
                      falmanage: falmanage,
                      widget: widget,
                      manage: manage,
                    ),
                  ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
