import 'package:basil_personal_web/providers/blog_screen_manage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogTile extends StatelessWidget {
  const BlogTile({
    Key? key,
    required this.image,
    required this.title,
    required this.date,
    required this.discrption,
    required this.url,
    required this.index,
    required this.animations,
    required this.controllers,
  }) : super(key: key);
  final String? image;
  final String? title;
  final String? date;
  final String? discrption;
  final String? url;
  final int? index;
  final List<Animation<double>>? animations;
  final List<AnimationController>? controllers;

  void launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  @override
  Widget build(BuildContext context) {
    final manage = Provider.of<BlogscreenManager>(context);
    final falmanage = Provider.of<BlogscreenManager>(context, listen: false);
    return ResponsiveBuilder(builder: (ctx, sizeInfo) {
      final double tileWidth =
          sizeInfo.isMobile ? sizeInfo.screenSize.width : 280;
      final Size imagesize = Size(
          sizeInfo.isMobile ? sizeInfo.screenSize.width : 270,
          sizeInfo.isMobile ? 150 : 200);
      final double titlesize = sizeInfo.isMobile ? 14 : 22;
      final double dateSize = sizeInfo.isMobile ? 9.3 : 12;
      final double descrptionSize = sizeInfo.isMobile ? 12 : 15;

      return InkWell(
        key: const ValueKey('aaaaaad'),
        onTap: () {
          launchURL(url);
        },
        onHover: (t) {
          if (t) {
            falmanage.setisHovered(true);
            falmanage.sethoveredIndex(index);
          } else {
            falmanage.setisHovered(false);
            falmanage.sethoveredIndex(null);
          }
        },
        child: FadeTransition(
          key: const ValueKey('aaaaaae'),
          opacity: animations![index!],

          // duration: Duration(seconds: 1 + (index! + 1)),
          child: Container(
            // color: Colors.amber,
            key: const ValueKey('aaaaaaf'),
            child: AnimatedOpacity(
              key: const ValueKey('aaaaaag'),
              opacity: manage.hoveredIndex == null
                  ? 1
                  : manage.isHovered && manage.hoveredIndex == index
                      ? 1
                      : .4,
              duration: const Duration(milliseconds: 450),
              child: Container(
                key: const ValueKey('aaaaaah'),
                width: tileWidth,
                padding: const EdgeInsets.all(10),
                child: Column(
                  key: const ValueKey('aaaaaai'),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      key: const ValueKey('aaaaaaj'),
                      height: imagesize.height,
                      width: imagesize.width,
                      child: Image.asset(
                        image!,
                        key: const ValueKey('aaaaaak'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                      key: ValueKey('aaaaaal'),
                    ),
                    AnimatedDefaultTextStyle(
                        key: const ValueKey('aaaaaam'),
                        child: Text(
                          title!,
                          key: const ValueKey('aaaaaan'),
                        ),
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: titlesize,
                          color:
                              manage.isHovered && manage.hoveredIndex == index
                                  ? const Color(0xff04c2c9)
                                  : const Color(0xff626262),
                        ),
                        duration: const Duration(milliseconds: 450)),
                    const SizedBox(
                      height: 10,
                      key: ValueKey('aaaaaao'),
                    ),
                    Text(
                      date!,
                      key: const ValueKey('aaaaaap'),
                      style: GoogleFonts.raleway(
                          fontSize: dateSize, color: const Color(0xffa1a1a1)),
                    ),
                    const SizedBox(
                      height: 12,
                      key: ValueKey('aaaaaaq'),
                    ),
                    Container(
                      key: const ValueKey('aaaaaar'),
                      width: 70,
                      height: 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xff05c2c9),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                      key: ValueKey('aaaaaas'),
                    ),
                    Text(
                      discrption!,
                      key: const ValueKey('aaaaaat'),
                      style: GoogleFonts.raleway(
                        fontSize: descrptionSize,
                        color: const Color(0xff7a7a7a),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
