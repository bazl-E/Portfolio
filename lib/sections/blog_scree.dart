import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key, this.height}) : super(key: key);
  final double? height;

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> with TickerProviderStateMixin {
  bool isHovered = false;
  int? hoveredIndex;
  AnimationController? controller;
  AnimationController? controller2;
  Animation<Offset>? animae;
  Animation<Offset>? animae2;
  List<AnimationController> controllers = [];
  List<Animation<double>> animations = [];

  void launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 4; i++) {
      controllers.add(AnimationController(
          vsync: this, duration: Duration(milliseconds: 100)));
      animations.add(Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
              parent: controllers[i], curve: Curves.fastLinearToSlowEaseIn)));
    }
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
      // controllers[0].forward().whenComplete(() {
      //   controllers[1].forward().whenComplete(
      //         () => controllers[2]
      //             .forward()
      //             .whenComplete(() => controllers[3].forward()),
      //       );
      // });
      // controllers[0].forward().whenComplete(() {
      //   controllers[1].forward();
      // }).whenComplete(() {
      //   controllers[2].forward();
      // }).whenComplete(() { controllers[2].forward();});
      // // controllers[0].forward();
      // controllers[0].addStatusListener((status) {
      //   if (status == AnimationStatus.completed) {
      //     controllers[1].forward();
      //   }
      // });
      // controllers[1].addStatusListener((status) {
      //   if (status == AnimationStatus.completed) {
      //     controllers[2].forward();
      //   }
      // });
      // controllers[2].addStatusListener((status) {
      //   if (status == AnimationStatus.completed) {
      //     controllers[3].forward();
      //   }
      // });
      for (var i = 0; i < 4; i++) {
        controllers[i].forward();
      }
    });
  }

  @override
  void dispose() {
    for (var i = 0; i < 4; i++) {
      controllers[i].dispose();
    }
    controller!.dispose();
    controller2!.dispose();
    super.dispose();
  }

  Widget buildBlogTile({
    String? image,
    String? title,
    String? date,
    String? discrption,
    String? url,
    int? index,
  }) {
    return InkWell(
      onTap: () {
        launchURL(url);
      },
      onHover: (t) {
        if (t) {
          setState(() {
            isHovered = true;
            hoveredIndex = index;
            print('hoverd');
          });
        } else {
          setState(() {
            isHovered = false;
            hoveredIndex = null;
          });
        }
      },
      child: AnimatedOpacity(
        opacity: animations[index!].value,
        duration: Duration(seconds: 1 + (index + 1)),
        child: Container(
          child: AnimatedOpacity(
            opacity: hoveredIndex == null
                ? 1
                : isHovered && hoveredIndex == index
                    ? 1
                    : .4,
            //  duration: Duration(milliseconds: 400),
            //   opacity: isHovered && hoveredIndex == index ? 1 : 0,
            duration: Duration(milliseconds: 450),
            child: Container(
              width: 280,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 200,
                    width: 270,
                    child: Image.asset(
                      image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  AnimatedDefaultTextStyle(
                      child: Text(
                        title!,
                      ),
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: isHovered && hoveredIndex == index
                            ? Color(0xff04c2c9)
                            : Color(0xff626262),
                      ),
                      duration: Duration(milliseconds: 450)),
                  SizedBox(height: 10),
                  Text(
                    date!,
                    style: GoogleFonts.raleway(
                        fontSize: 12, color: Color(0xffa1a1a1)),
                  ),
                  SizedBox(height: 12),
                  Container(
                    width: 70,
                    height: 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xff05c2c9),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    discrption!,
                    style: GoogleFonts.raleway(
                      fontSize: 15,
                      color: Color(0xff7a7a7a),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (ctx, cnst) => Container(
              height: widget.height!,
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
                  SizedBox(height: 150),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 25,
                      runSpacing: 25,
                      children: [
                        buildBlogTile(
                          date: 'APRIL 29, 2021',
                          title: 'Breaking Your Coder\'s Block',
                          discrption:
                              'At one time or another, as a developer, we\'ve all found ourselves hopelessly stuck on a coding issue...',
                          image: 'blog-1.jpg',
                          url:
                              'http://blog.eyecuelab.com/2016/04/29/breaking-your-coders-block/',
                          index: 0,
                        ),
                        buildBlogTile(
                          date: 'March 19, 2020',
                          title: '!Awake: This is Your Brain on Caffeine',
                          discrption:
                              'If there\'s one thing I can truly claim to be an expert on,it\'s staying awake. For five years I struggled to stay employed...',
                          image: 'blog-2.jpg',
                          url:
                              'http://blog.eyecuelab.com/2015/03/19/this-is-your-brain-on-caffeine/',
                          index: 1,
                        ),
                        buildBlogTile(
                          date: 'March 04, 2020',
                          title: 'Getting a Handle on Handlebars',
                          discrption:
                              'Here at EyeCue Lab we render most of our data-laden HTML pages in Handlebar templates...',
                          image: 'blog-3.jpg',
                          url:
                              'http://blog.eyecuelab.com/2015/03/04/getting-a-handle-on-handlebars/',
                          index: 2,
                        ),
                        buildBlogTile(
                          date: 'FEBRUARY 23, 2021',
                          title: '5 Extensions for Your Chrome Toolbelt',
                          discrption:
                              'If you\'re not using Google Chrome as a front-end web developer, you\'re missing out. Not only is Chrome the...',
                          image: 'blog-4.jpg',
                          url:
                              'http://blog.eyecuelab.com/2015/02/23/essential_extensions/',
                          index: 3,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
