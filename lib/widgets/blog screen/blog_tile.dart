import 'package:basil_personal_web/providers/blog_screen_manage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogTile extends StatelessWidget {
  BlogTile({
    Key? key,
    required this.image,
    required this.title,
    required this.date,
    required this.discrption,
    required this.url,
    required this.index,
    required this.animations,
  }) : super(key: key);
  final String? image;
  final String? title;
  final String? date;
  final String? discrption;
  final String? url;
  final int? index;
  final List<Animation<double>> animations;

  void launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  @override
  Widget build(BuildContext context) {
    final manage = Provider.of<BlogscreenManager>(context);
    final falmanage = Provider.of<BlogscreenManager>(context, listen: false);
    return InkWell(
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
      child: AnimatedOpacity(
        opacity: animations[index!].value,
        duration: Duration(seconds: 1 + (index! + 1)),
        child: Container(
          child: AnimatedOpacity(
            opacity: manage.hoveredIndex == null
                ? 1
                : manage.isHovered && manage.hoveredIndex == index
                    ? 1
                    : .4,
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
                        color: manage.isHovered && manage.hoveredIndex == index
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
}
