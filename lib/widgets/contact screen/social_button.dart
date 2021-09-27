import 'package:basil_personal_web/providers/contact_screen_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
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
      key: const ValueKey('aaaaaaaai'),
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
          controllers![index!].reset();
        }
      },
      child: AnimatedContainer(
          key: const ValueKey('aaaaaaaaj'),
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.only(left: 17, right: 17),
          color: isReady(context)
              ? const Color(0xff05c2c9)
              : const Color(0xff262f38),
          width: isReady(context) ? 53 : 55,
          height: isReady(context) ? 53 : 55,
          child: Column(
            key: const ValueKey('aaaaaaaak'),
            mainAxisSize: MainAxisSize.min,
            children: [
              SlideTransition(
                key: const ValueKey('aaaaaaaal'),
                position: animations![index!],
                child: Opacity(
                  key: const ValueKey('aaaaaaaam'),
                  opacity: isReady(context) ? 1 : 0,
                  child: Image.asset(
                    image!,
                    key: const ValueKey('aaaaaaaan'),
                    color: Colors.white,
                  ),
                ),
              ),
              SlideTransition(
                key: const ValueKey('aaaaaaaao'),
                position: animations2![index!],
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 100),
                  opacity: isReady(context) ? 0 : 1,
                  child: Image.asset(
                    image!,
                    key: const ValueKey('aaaaaaaap'),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
