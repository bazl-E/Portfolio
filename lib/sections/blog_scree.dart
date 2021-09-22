// import 'package:basil_personal_web/providers/blog_screen_manage.dart';
// import 'package:basil_personal_web/providers/blog_screen_manage.dart';
import 'package:basil_personal_web/providers/blog_screen_manage.dart';
import 'package:basil_personal_web/widgets/blog%20screen/blog_tile.dart';
// import 'package:findbasilprofilo/providers/blog_screen_manage.dart';
// import 'package:findbasilprofilo/widgets/blog%20screen/blog_tile.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

// import 'package:basil_personal_web/widgets/blog%20screen/blog_tile.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';
// import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key, this.height}) : super(key: key);
  final double? height;

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> with TickerProviderStateMixin {
  // bool isFrist = true;

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
          vsync: this, duration: Duration(seconds: 1 + (i + 1))));
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

    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {

    // });
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

  @override
  Widget build(BuildContext context) {
    // controller!.forward();
    // controller2!.forward();

    // for (var i = 0; i < 4; i++) {
    //   controllers[i].forward();
    // }
    final manage = Provider.of<BlogscreenManager>(context);
    final falManage = Provider.of<BlogscreenManager>(context, listen: false);
    // if (!manage.isFrist) {
    controller!.forward();
    controller2!.forward();

    for (var i = 0; i < 4; i++) {
      controllers[i].forward();
      // }
    }
    return ResponsiveBuilder(builder: (ctx, sizeInfo) {
      final double titleSize = sizeInfo.isMobile ? 33.33 : 40;
      return VisibilityDetector(
        key: ValueKey('BlogScreenKey'),
        onVisibilityChanged: (vi) {
          // if (vi.visibleFraction * 100 > 70 && manage.isFrist) {
          //   for (var i = 0; i < 4; i++) {
          //     controllers[i].forward();
          //   }
          //   controller!.forward();
          //   controller2!.forward().whenComplete(
          //         () => falManage.setisFrist(false),
          //       );
          // }
        },
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: double.infinity,
            maxWidth: double.infinity,
            minHeight: widget.height!,
            minWidth: double.infinity,
          ),
          key: ValueKey('ar'),
          // height: widget.height!,
          // width: MediaQuery.of(context).size.width,
          child: Column(
            key: ValueKey('as'),
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SlideTransition(
                key: ValueKey('at'),
                position: animae!,
                child: Container(
                  key: ValueKey('au'),
                  padding: EdgeInsets.only(top: 4.9.h, bottom: 10),
                  child: Text(
                    'BLOG',
                    key: ValueKey('av'),
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w700,
                        fontSize: titleSize,
                        color: Color(0xff444649)),
                  ),
                ),
              ),
              SlideTransition(
                key: ValueKey('aw'),
                position: animae2!,
                child: Container(
                  key: ValueKey('ax'),
                  width: 70,
                  height: 4,
                  color: Color(0xff45474a),
                ),
              ),
              SizedBox(
                height: sizeInfo.isMobile ? 2.h : 7.9.h,
                key: ValueKey('ay'),
              ),
              // FittedBox(
              //   key: ValueKey('az'),
              //   fit: BoxFit.scaleDown,
              //   child:
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: sizeInfo.isMobile ? 20 : 70, vertical: 70),
                child: Wrap(
                  key: ValueKey('aaa'),
                  alignment: WrapAlignment.center,
                  spacing: 2.4.h,
                  runSpacing: 2.4.h,
                  children: [
                    BlogTile(
                      key: ValueKey('aab'),
                      controllers: controllers,
                      animations: animations,
                      date: 'APRIL 29, 2021',
                      title: 'Breaking Your Coder\'s Block',
                      discrption:
                          'At one time or another, as a developer, we\'ve all found ourselves hopelessly stuck on a coding issue...',
                      image: 'assets/blog-1.jpg',
                      url:
                          'http://blog.eyecuelab.com/2016/04/29/breaking-your-coders-block/',
                      index: 0,
                    ),
                    BlogTile(
                      key: ValueKey('aac'),
                      controllers: controllers,
                      animations: animations,
                      date: 'MARCH 19, 2020',
                      title: '!Awake: This is Your Brain on Caffeine',
                      discrption:
                          'If there\'s one thing I can truly claim to be an expert on,it\'s staying awake. For five years I struggled to stay employed...',
                      image: 'assets/blog-2.jpg',
                      url:
                          'http://blog.eyecuelab.com/2015/03/19/this-is-your-brain-on-caffeine/',
                      index: 1,
                    ),
                    BlogTile(
                      key: ValueKey('aad'),
                      controllers: controllers,
                      animations: animations,
                      date: 'March 09, 2020',
                      title: 'Getting a Handle on Handlebars',
                      discrption:
                          'Here at EyeCue Lab we render most of our data-laden HTML pages in Handlebar templates...',
                      image: 'assets/blog-3.jpg',
                      url:
                          'http://blog.eyecuelab.com/2015/03/04/getting-a-handle-on-handlebars/',
                      index: 2,
                    ),
                    BlogTile(
                      key: ValueKey('aae'),
                      controllers: controllers,
                      animations: animations,
                      date: 'FEBRUARY 23, 2021',
                      title: '5 Extensions for Your Chrome Toolbelt',
                      discrption:
                          'If you\'re not using Google Chrome as a front-end web developer, you\'re missing out. Not only is Chrome the...',
                      image: 'assets/blog-4.jpg',
                      url:
                          'http://blog.eyecuelab.com/2015/02/23/essential_extensions/',
                      index: 3,
                    ),
                  ],
                ),
              ),
              // )
            ],
          ),
        ),
      );
    });
  }
}
