import 'dart:math';

import 'package:basil_personal_web/helper/firebaseconnect.dart';
import 'package:basil_personal_web/providers/contact_screen_manager.dart';
import 'package:basil_personal_web/widgets/contact%20screen/home_button.dart';
import 'package:basil_personal_web/widgets/contact%20screen/social_button.dart';
import 'package:basil_personal_web/widgets/contact%20screen/social_button_row.dart';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
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
  // AnimationController? rightanimaController;
  // AnimationController? rightanimaController2;

  void onSave() async {
    final falmanage = Provider.of<ContactscreenManager>(context, listen: false);
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
    falmanage.setisFormSaving(true);

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

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      leftanimaController!.forward();
      setState(() {
        height = 350;
        width = 500;
      });
    });
  }

  @override
  void dispose() {
    for (var i = 0; i < 5; i++) {
      controllers[i].dispose();
    }
    leftanimaController!.dispose();
    // rightanimaController!.dispose();
    // rightanimaController2!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final falmanage = Provider.of<ContactscreenManager>(context, listen: false);
    final manage = Provider.of<ContactscreenManager>(context);

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
                                  falmanage.setisSubmitHovered(true);
                                } else {
                                  falmanage.setisSubmitHovered(false);
                                }
                              },
                              child: Container(
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
                                    vertical: 5, horizontal: 20),
                                child: TextButton(
                                  onPressed:
                                      manage.isFormSaving ? null : onSave,
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
          SocialButtonRow(
            animations2: animations2,
            animations: animations,
            controllers: controllers,
            falmanage: falmanage,
            widget: widget,
            manage: manage,
          ),
        ]),
      ),
    );
  }
}
