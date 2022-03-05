import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetails extends StatelessWidget {
  ProjectDetails({
    Key? key,
    required this.images,
    required this.title,
    required this.subtitle,
    required this.descrption,
    required this.gitUrl,
  }) : super(key: key);
  // final String? imageURl;
  final List<String>? images;
  final String? title;
  final String? subtitle;
  final String? descrption;
  final String? gitUrl;

  final PageController controller = PageController();
  final List<Color> colors = [
    Colors.amber,
    Colors.teal,
    Colors.blueGrey,
    Colors.purple,
  ];
  void launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  @override
  Widget build(BuildContext context) {
    return Dialog(
        key: const ValueKey('aaaaaaaaq'),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            key: const ValueKey('aaaaaaaar'),
            color: Colors.amber,
            width: 700,
            height: 715,
            child: Column(
              key: const ValueKey('aaaaaaaas'),
              children: [
                Container(
                  key: const ValueKey('aaaaaaaat'),
                  height: 450,
                  color: Colors.teal,
                  child: Stack(
                    key: const ValueKey('aaaaaaaau'),
                    children: [
                      PageView.builder(
                        controller: controller,
                        // itemCount: i % colors.length,
                        itemBuilder: (ctx, i) => Container(
                          key: ValueKey('aaaaaaaav$i'),
                          // child: Container(
                          //   color: colors[i % colors.length],

                          // )
                          child: Image.asset(
                            images![i % images!.length],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        key: const ValueKey('aaaaaaaaw'),
                        bottom: 0,
                        child: SizedBox(
                          key: const ValueKey('aaaaaaaax'),
                          height: 55,
                          width: 700,
                          child: Row(
                            key: const ValueKey('aaaaaaaay'),
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                key: const ValueKey('aaaaaaaaz'),
                                onTap: () {
                                  controller.previousPage(
                                      duration:
                                          const Duration(milliseconds: 800),
                                      curve: Curves.fastLinearToSlowEaseIn);
                                },
                                child: Container(
                                  key: const ValueKey('aaaaaaaaaa'),
                                  width: 60,
                                  height: 55,
                                  color: Colors.black
                                      .withAlpha(50)
                                      .withOpacity(.3),
                                  child: const Icon(
                                    Icons.keyboard_arrow_left,
                                    key: ValueKey('aaaaaaaaab'),
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              InkWell(
                                key: const ValueKey('aaaaaaaaac'),
                                onTap: () {
                                  controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 800),
                                      curve: Curves.easeIn);
                                },
                                child: Container(
                                  key: const ValueKey('aaaaaaaaad'),
                                  width: 60,
                                  height: 55,
                                  color: Colors.black
                                      .withAlpha(50)
                                      .withOpacity(.3),
                                  child: const Icon(
                                    Icons.keyboard_arrow_right,
                                    key: ValueKey('aaaaaaaaae'),
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  key: const ValueKey('aaaaaaaaaf'),
                  height: 3,
                  width: double.infinity,
                  color: Colors.black,
                ),
                Container(
                  key: const ValueKey('aaaaaaaaag'),
                  padding: const EdgeInsets.only(
                      top: 30, left: 20, right: 20, bottom: 20),
                  height: 262,
                  color: Colors.white,
                  child: Column(
                    key: const ValueKey('aaaaaaaaah'),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title!,
                          key: const ValueKey('aaaaaaaaai'),
                          style: GoogleFonts.raleway(
                              fontSize: 30,
                              color: const Color(0xff444444),
                              fontWeight: FontWeight.bold)),
                      Text(subtitle!,
                          key: const ValueKey('aaaaaaaaaj'),
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: const Color(0xffc0c0c0))),
                      const SizedBox(
                        height: 10,
                        key: ValueKey('aaaaaaaaak'),
                      ),
                      const Divider(
                        key: ValueKey('aaaaaaaaal'),
                        color: Color(0xffe5e5e5),
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 10,
                        key: ValueKey('aaaaaaaaam'),
                      ),
                      Text(
                        descrption!,
                        key: const ValueKey('aaaaaaaaan'),
                        style: GoogleFonts.raleway(
                          fontSize: 14,
                        ),
                      ),
                      // SizedBox(height: 15),
                      const Spacer(
                        key: ValueKey('aaaaaaaaao'),
                      ),
                      Row(
                        key: const ValueKey('aaaaaaaaap'),
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              launchURL(gitUrl);
                            },
                            child: Container(
                              key: const ValueKey('aaaaaaaaaq'),
                              width: 140,
                              height: 40,
                              color: const Color(0xffe31b6d),
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 13,
                              ),
                              child: Row(
                                key: const ValueKey('aaaaaaaaar'),
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                      key: const ValueKey('aaaaaaaaas'),
                                      height: 23,
                                      width: 23,
                                      child: Image.asset('assets/11.png',
                                          key: const ValueKey('aaaaaaaaat'),
                                          color: Colors.white)),
                                  Text(
                                    "VIEW GIT",
                                    key: const ValueKey('aaaaaaaaau'),
                                    style: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                              key: const ValueKey('aaaaaaaaav'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.close,
                                key: ValueKey('aaaaaaaaaw'),
                                size: 35,
                                color: Color(0xffbbbbbb),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
