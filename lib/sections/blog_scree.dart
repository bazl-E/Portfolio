// import 'package:basil_personal_web/providers/blog_screen_manage.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:basil_personal_web/widgets/blog%20screen/blog_tile.dart';
// import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key, this.height}) : super(key: key);
  final double? height;

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> with TickerProviderStateMixin {
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

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller!.forward();
      controller2!.forward();

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

  @override
  Widget build(BuildContext context) {
    // controller!.forward();
    // controller2!.forward();

    // for (var i = 0; i < 4; i++) {
    //   controllers[i].forward();
    // }
    return Container(
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
                BlogTile(
                  controllers: controllers,
                  animations: animations,
                  date: 'APRIL 29, 2021',
                  title: 'Breaking Your Coder\'s Block',
                  discrption:
                      'At one time or another, as a developer, we\'ve all found ourselves hopelessly stuck on a coding issue...',
                  image: 'blog-1.jpg',
                  url:
                      'http://blog.eyecuelab.com/2016/04/29/breaking-your-coders-block/',
                  index: 0,
                ),
                BlogTile(
                  controllers: controllers,
                  animations: animations,
                  date: 'March 19, 2020',
                  title: '!Awake: This is Your Brain on Caffeine',
                  discrption:
                      'If there\'s one thing I can truly claim to be an expert on,it\'s staying awake. For five years I struggled to stay employed...',
                  image: 'blog-2.jpg',
                  url:
                      'http://blog.eyecuelab.com/2015/03/19/this-is-your-brain-on-caffeine/',
                  index: 1,
                ),
                BlogTile(
                  controllers: controllers,
                  animations: animations,
                  date: 'March 04, 2020',
                  title: 'Getting a Handle on Handlebars',
                  discrption:
                      'Here at EyeCue Lab we render most of our data-laden HTML pages in Handlebar templates...',
                  image: 'blog-3.jpg',
                  url:
                      'http://blog.eyecuelab.com/2015/03/04/getting-a-handle-on-handlebars/',
                  index: 2,
                ),
                BlogTile(
                  controllers: controllers,
                  animations: animations,
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
    );
  }
}
