import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectDetails extends StatelessWidget {
  ProjectDetails(
      {Key? key,
      this.images,
      this.title,
      this.subtitle,
      this.descrption,
      this.gitUrl})
      : super(key: key);
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
  @override
  Widget build(BuildContext context) {
    print(1 % 4);
    return Dialog(
        key: ValueKey('aaaaaaaaq'),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            key: ValueKey('aaaaaaaar'),
            color: Colors.amber,
            width: 700,
            height: 715,
            child: Column(
              key: ValueKey('aaaaaaaas'),
              children: [
                Container(
                  key: ValueKey('aaaaaaaat'),
                  height: 450,
                  color: Colors.teal,
                  child: Stack(
                    key: ValueKey('aaaaaaaau'),
                    children: [
                      PageView.builder(
                        controller: controller,
                        // itemCount: i % colors.length,
                        itemBuilder: (ctx, i) => Container(
                            key: ValueKey('aaaaaaaav$i'),
                            child: Container(
                              color: colors[i % colors.length],
                            )
                            // Image.asset(
                            //   images![i],
                            //   fit: BoxFit.cover,
                            // ),
                            ),
                      ),
                      Positioned(
                        key: ValueKey('aaaaaaaaw'),
                        bottom: 0,
                        child: Container(
                          key: ValueKey('aaaaaaaax'),
                          height: 55,
                          width: 700,
                          child: Row(
                            key: ValueKey('aaaaaaaay'),
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                key: ValueKey('aaaaaaaaz'),
                                onTap: () {
                                  controller.previousPage(
                                      duration: Duration(milliseconds: 800),
                                      curve: Curves.fastLinearToSlowEaseIn);
                                },
                                child: Container(
                                  key: ValueKey('aaaaaaaaaa'),
                                  width: 60,
                                  height: 55,
                                  color: Colors.black
                                      .withAlpha(50)
                                      .withOpacity(.3),
                                  child: Icon(
                                    Icons.keyboard_arrow_left,
                                    key: ValueKey('aaaaaaaaab'),
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              InkWell(
                                key: ValueKey('aaaaaaaaac'),
                                onTap: () {
                                  controller.nextPage(
                                      duration: Duration(milliseconds: 800),
                                      curve: Curves.slowMiddle);
                                },
                                child: Container(
                                  key: ValueKey('aaaaaaaaad'),
                                  width: 60,
                                  height: 55,
                                  color: Colors.black
                                      .withAlpha(50)
                                      .withOpacity(.3),
                                  child: Icon(
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
                  key: ValueKey('aaaaaaaaaf'),
                  height: 3,
                  width: double.infinity,
                  color: Colors.black,
                ),
                Container(
                  key: ValueKey('aaaaaaaaag'),
                  padding:
                      EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
                  height: 262,
                  color: Colors.white,
                  child: Column(
                    key: ValueKey('aaaaaaaaah'),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ChowNow Discover',
                          key: ValueKey('aaaaaaaaai'),
                          style: GoogleFonts.raleway(
                              fontSize: 30,
                              color: Color(0xff444444),
                              fontWeight: FontWeight.bold)),
                      Text('FOOD ORDERING PLATFORM',
                          key: ValueKey('aaaaaaaaaj'),
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xffc0c0c0))),
                      SizedBox(
                        height: 10,
                        key: ValueKey('aaaaaaaaak'),
                      ),
                      Divider(
                        key: ValueKey('aaaaaaaaal'),
                        color: Color(0xffe5e5e5),
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 10,
                        key: ValueKey('aaaaaaaaam'),
                      ),
                      Text(
                        'ChowNow Discover is a platform that lets customers discover new local restaurants and provides business owners with tools to convert first time orders into lifelong diners.',
                        key: ValueKey('aaaaaaaaan'),
                        style: GoogleFonts.raleway(
                          fontSize: 14,
                        ),
                      ),
                      // SizedBox(height: 15),
                      Spacer(
                        key: ValueKey('aaaaaaaaao'),
                      ),
                      Row(
                        key: ValueKey('aaaaaaaaap'),
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            key: ValueKey('aaaaaaaaaq'),
                            width: 140,
                            height: 40,
                            color: Color(0xffe31b6d),
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 13,
                            ),
                            child: Row(
                              key: ValueKey('aaaaaaaaar'),
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    key: ValueKey('aaaaaaaaas'),
                                    height: 23,
                                    width: 23,
                                    child: Image.asset('assets/11.png',
                                        key: ValueKey('aaaaaaaaat'),
                                        color: Colors.white)),
                                Text(
                                  "VIEW GIT",
                                  key: ValueKey('aaaaaaaaau'),
                                  style: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                              key: ValueKey('aaaaaaaaav'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
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
