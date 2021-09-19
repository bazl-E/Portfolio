import 'package:basil_personal_web/providers/contact_screen_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButton extends StatelessWidget {
  SocialButton({
    Key? key,
    required this.url,
    required this.image,
    required this.index,
    required this.controllers,
    required this.animations,
    required this.animations2,
  }) : super(key: key);
  final String? url;
  final String? image;

  final int? index;
  final List<AnimationController>? controllers;

  final List<Animation<Offset>>? animations;
  final List<Animation<Offset>>? animations2;

  bool isReady(BuildContext context) {
    final manage = Provider.of<ContactscreenManager>(context);
    return (manage.issocialHovered && manage.socialHoveredindex == index);
  }

  void launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  @override
  Widget build(BuildContext context) {
    final falmanage = Provider.of<ContactscreenManager>(context, listen: false);

    return InkWell(
      key: ValueKey('aaaaaaaai'),
      onTap: () {
        launchURL(url);
      },
      onHover: (t) {
        if (t) {
          falmanage.setissocialHovered(true);
          falmanage.setsocialHoveredindex(index);
          controllers![index!].forward();
        } else {
          falmanage.setissocialHovered(false);
          falmanage.setsocialHoveredindex(null);
          controllers![index!]..reset();
        }
      },
      child: AnimatedContainer(
          key: ValueKey('aaaaaaaaj'),
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.only(left: 17, right: 17),
          color: isReady(context) ? Color(0xff05c2c9) : Color(0xff262f38),
          width: isReady(context) ? 53 : 55,
          height: isReady(context) ? 53 : 55,
          child: Column(
            key: ValueKey('aaaaaaaak'),
            mainAxisSize: MainAxisSize.min,
            children: [
              SlideTransition(
                key: ValueKey('aaaaaaaal'),
                position: animations![index!],
                child: Opacity(
                  key: ValueKey('aaaaaaaam'),
                  opacity: isReady(context) ? 1 : 0,
                  child: Image.asset(
                    image!,
                    key: ValueKey('aaaaaaaan'),
                    color: Colors.white,
                  ),
                ),
              ),
              SlideTransition(
                key: ValueKey('aaaaaaaao'),
                position: animations2![index!],
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 100),
                  opacity: isReady(context) ? 0 : 1,
                  child: Image.asset(
                    image!,
                    key: ValueKey('aaaaaaaap'),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
