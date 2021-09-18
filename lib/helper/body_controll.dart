import 'package:basil_personal_web/providers/body_controll_manage.dart';
import 'package:basil_personal_web/sections/about_screen.dart';
import 'package:basil_personal_web/sections/blog_scree.dart';
import 'package:basil_personal_web/sections/contact_screen.dart';
import 'package:basil_personal_web/sections/project_screen.dart';
import 'package:basil_personal_web/sections/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:scroll_to_index/scroll_to_index.dart';

class BodyController extends StatefulWidget {
  @override
  _BodyControllerState createState() => _BodyControllerState();
}

class _BodyControllerState extends State<BodyController>
    with SingleTickerProviderStateMixin {
  AutoScrollController? _autoScrollController;

  final scrollDirection = Axis.vertical;
  // Color titleColor = Colors.white;
  final dataKey = new GlobalKey();
  // int? selectedButton;
  // int? currentButton;
  final List<String> titles = [
    'HOME',
    'ABOUT',
    'PORTFOLIO',
    'BLOG',
    'CONTACT',
  ];
// var size = MediaQuery.of(context).size;
  // bool get isExpaned {
  //   return Provider.of<BodyControllManager>(context).isExpaned;
  // }

  bool get _isAppBarExpanded {
    return _autoScrollController!.hasClients &&
        _autoScrollController!.offset > (160 - kToolbarHeight);
  }

  Future<void> goToHome() async {
    await Scrollable.ensureVisible(dataKey.currentContext!);
  }

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    );

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final falmanage =
          Provider.of<BodyControllManager>(context, listen: false);
      final manage = Provider.of<BodyControllManager>(context, listen: false);
      _autoScrollController!
        ..addListener(
          () => _isAppBarExpanded
              ? manage.isExpaned != false
                  ? falmanage.setisisExpaned(false)
                  //  setState(
                  //     () {
                  //       isExpaned = false;
                  //       print('setState is called');
                  //     },
                  //   )
                  : {}
              : manage.isExpaned != true
                  ? falmanage.setisisExpaned(true)
                  // setState(() {
                  //     print('setState is called');
                  //     isExpaned = true;
                  //   })
                  : {},
        );
    });
    // ..addListener(
    //     () => _isAppBarExpanded
    //         ? isExpaned != false
    //             ? setState(
    //                 () {
    //                   isExpaned = false;
    //                   print('setState is called');
    //                 },
    //               )
    //             : {}
    //         : isExpaned != true
    //             ? setState(() {
    //                 print('setState is called');
    //                 isExpaned = true;
    //               })
    //             : {},
    //   );

    super.initState();
  }

  Future _scrollToIndex(int index) async {
    await _autoScrollController!.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin,
        duration: Duration(milliseconds: 500));
    // _autoScrollController!.highlight(index);
  }

  // Future _sscrollToIndex(int index) async {
  //   await _autoScrollController!
  //       .animateTo(0, duration: Duration(seconds: 1), curve: Curves.bounceIn);
  // }

  // Widget _wrapScrollTag({int? index, Widget? child}) {
  //   return VisibilityDetector(
  //       key: Key('$index'),
  //       onVisibilityChanged: (visibilityInfo) {
  //         var visiblePercentage = visibilityInfo.visibleFraction * 100;
  //         // print('Widget $index is $visiblePercentage% visible');
  //         if (visiblePercentage > 30) {
  //           setState(() {
  //             selectedButton = index;
  //           });
  //         } else {
  //           // setState(() {});
  //         }
  //       },
  //       child: AutoScrollTag(
  //         key: ValueKey(index),
  //         controller: _autoScrollController!,
  //         index: index!,
  //         child: child!,
  //         // highlightColor: Colors.black.withOpacity(0.1),
  //       ));
  // }

  // Widget _buildTitle(int i) {
  //   return InkWell(
  //     onTap: () async {
  //       print(i);
  //       if (i == 0) {
  //         // _sscrollToIndex(i);
  //         goToHome();
  //       } else {
  //         _scrollToIndex(i);
  //       }

  //       setState(() {
  //         selectedButton = i;
  //       });
  //     },
  //     onHover: (t) {
  //       if (t) {
  //         setState(() {
  //           currentButton = i;
  //         });
  //       }
  //       if (!t) {
  //         setState(() {
  //           currentButton = null;
  //         });
  //       }
  //     },
  //     child: Container(
  //         margin: EdgeInsets.symmetric(horizontal: 20),
  //         // width: 100,
  //         height: 53,
  //         child: Center(
  //           child: AnimatedDefaultTextStyle(
  //               child: Text(titles[i]),
  //               style: GoogleFonts.raleway(
  //                   color: selectedButton == i || currentButton == i
  //                       ? Colors.pink
  //                       : titleColor,
  //                   fontSize: 16),
  //               duration: Duration(milliseconds: 400)),
  //         )),
  //   );
  // }

  // _buildSliverAppbar() {
  //   final size = MediaQuery.of(context).size.height;
  //   final width = MediaQuery.of(context).size.width;
  //   return SliverAppBar(
  //     systemOverlayStyle: SystemUiOverlayStyle.light,
  //     // brightness: Brightness.light,
  //     pinned: true,
  //     expandedHeight: size,
  //     backgroundColor: Colors.white,
  //     flexibleSpace: FlexibleSpaceBar(
  //       collapseMode: CollapseMode.parallax,
  //       background:
  //           // _wrapScrollTag(
  //           //   index: 0,
  //           //   child:
  //           Container(
  //         child: WelcomePage(scrollTo: _scrollToIndex),
  //         key: dataKey,
  //         // ),
  //       ),
  //     ),
  //     bottom: PreferredSize(
  //       preferredSize: Size.fromHeight(0),
  //       child: AnimatedOpacity(
  //         duration: Duration(milliseconds: 500),
  //         opacity: isExpaned ? 0.0 : 1,
  //         child: Container(
  //           alignment: Alignment.topRight,
  //           padding: EdgeInsets.all(0),
  //           margin: EdgeInsets.all(0),
  //           color: Color(0xFF1B242F),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               FittedBox(
  //                 child: Container(
  //                   alignment: Alignment.centerLeft,
  //                   child: Row(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: [
  //                       if (width > 1300)
  //                         SizedBox(
  //                           width: width * .15,
  //                         ),
  //                       for (var i = 0; i < titles.length; i++) _buildTitle(i)
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               Container(
  //                 width: double.infinity,
  //                 height: 3,
  //                 color: Color(0xff04c2c9),
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        controller: _autoScrollController,
        slivers: <Widget>[
          BuildSliverAppBAr(
            goToHome: goToHome,
            scrollToIndex: _scrollToIndex,
            titles: titles,
            dataKey: dataKey,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                WrapScrollTag(
                    autoScrollController: _autoScrollController,
                    index: 1,
                    child: AboutScreen(
                      height: size - kToolbarHeight,
                      scroll: _scrollToIndex,
                    )),
                WrapScrollTag(
                    autoScrollController: _autoScrollController,
                    index: 2,
                    child: ProjectScreen(
                      height: size - kToolbarHeight,
                    )),
                WrapScrollTag(
                    autoScrollController: _autoScrollController,
                    index: 3,
                    child: BlogScreen(
                      height: size - kToolbarHeight,
                    )),
                WrapScrollTag(
                  autoScrollController: _autoScrollController,
                  index: 4,
                  child: ContactScreen(
                    height: size - kToolbarHeight,
                    gotoHome: goToHome,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuildSliverAppBAr extends StatelessWidget {
  BuildSliverAppBAr({
    Key? key,
    required this.scrollToIndex,
    required this.titles,
    required this.dataKey,
    required this.goToHome,
  }) : super(key: key);
  final Future Function(int i)? scrollToIndex;
  final List<String>? titles;
  final Function goToHome;
  // final List<String> titles;

  final GlobalKey dataKey;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final manage = Provider.of<BodyControllManager>(context);
    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      pinned: true,
      expandedHeight: size,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Container(
          child: WelcomePage(scrollTo: scrollToIndex),
          key: dataKey,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: manage.isExpaned ? 0.0 : 1,
          child: Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(0),
            color: Color(0xFF1B242F),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                FittedBox(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (width > 1300)
                          SizedBox(
                            width: width * .15,
                          ),
                        for (var i = 0; i < titles!.length; i++)
                          CustomTitles(
                            i: i,
                            scrollToIndex: scrollToIndex,
                            goToHome: goToHome,
                            titles: titles!,
                          )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 3,
                  color: Color(0xff04c2c9),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTitles extends StatelessWidget {
  const CustomTitles({
    Key? key,
    required this.i,
    required this.scrollToIndex,
    required this.goToHome,
    required this.titles,
  }) : super(key: key);

  final int i;
  final Future Function(int i)? scrollToIndex;
  final Function goToHome;
  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    final falamanage = Provider.of<BodyControllManager>(context, listen: false);
    final manage = Provider.of<BodyControllManager>(context);
    return InkWell(
      onTap: () async {
        print(i);
        if (i == 0) {
          // _sscrollToIndex(i);
          await goToHome();
        } else {
          scrollToIndex!(i);
        }
        falamanage.setselectedButton(i);
        // setState(() {
        //   selectedButton = i;
        // });
      },
      onHover: (t) {
        if (t) {
          falamanage.setcurrentButton(i);
          // setState(() {
          //   currentButton = i;
          // });
        }
        if (!t) {
          falamanage.setcurrentButton(null);
          // setState(() {
          //   currentButton = null;
          // });
        }
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          // width: 100,
          height: 53,
          child: Center(
            child: AnimatedDefaultTextStyle(
                child: Text(titles[i]),
                style: GoogleFonts.raleway(
                    color:
                        manage.selectedButton == i || manage.currentButton == i
                            ? Colors.pink
                            : Colors.white,
                    fontSize: 16),
                duration: Duration(milliseconds: 400)),
          )),
    );
  }
}

class WrapScrollTag extends StatelessWidget {
  const WrapScrollTag({
    Key? key,
    required this.index,
    required this.autoScrollController,
    required this.child,
  }) : super(key: key);

  final int? index;
  final AutoScrollController? autoScrollController;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final falamanage = Provider.of<BodyControllManager>(context, listen: false);
    return VisibilityDetector(
        key: Key('$index'),
        onVisibilityChanged: (visibilityInfo) {
          var visiblePercentage = visibilityInfo.visibleFraction * 100;
          // print('Widget $index is $visiblePercentage% visible');
          if (visiblePercentage > 30) {
            falamanage.setselectedButton(index);
            // setState(() {
            //   selectedButton = index;
            // });
          } else {
            // setState(() {});
          }
        },
        child: AutoScrollTag(
          key: ValueKey(index),
          controller: autoScrollController!,
          index: index!,
          child: child!,
          // highlightColor: Colors.black.withOpacity(0.1),
        ));
  }
}
