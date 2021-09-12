import 'package:basil_personal_web/sections/about_screen.dart';
import 'package:basil_personal_web/sections/blog_scree.dart';
import 'package:basil_personal_web/sections/contact_screen.dart';
import 'package:basil_personal_web/sections/project_screen.dart';
import 'package:basil_personal_web/sections/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
  Color titleColor = Colors.white;
  final dataKey = new GlobalKey();

  int? selectedButton;
  int? currentButton;
  final List titles = [
    'HOME',
    'ABOUT',
    'PORTFOLIO',
    'BLOG',
    'CONTACT',
  ];
// var size = MediaQuery.of(context).size;
  bool isExpaned = true;
  bool get _isAppBarExpanded {
    return _autoScrollController!.hasClients &&
        _autoScrollController!.offset > (160 - kToolbarHeight);
  }

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    )..addListener(
        () => _isAppBarExpanded
            ? isExpaned != false
                ? setState(
                    () {
                      isExpaned = false;
                      print('setState is called');
                    },
                  )
                : {}
            : isExpaned != true
                ? setState(() {
                    print('setState is called');
                    isExpaned = true;
                  })
                : {},
      );

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

  Widget _wrapScrollTag({int? index, Widget? child}) {
    return VisibilityDetector(
        key: Key('$index'),
        onVisibilityChanged: (visibilityInfo) {
          var visiblePercentage = visibilityInfo.visibleFraction * 100;
          // print('Widget $index is $visiblePercentage% visible');
          if (visiblePercentage > 20) {
            setState(() {
              selectedButton = index;
            });
          } else {
            // setState(() {});
          }
        },
        child: AutoScrollTag(
          key: ValueKey(index),
          controller: _autoScrollController!,
          index: index!,
          child: child!,
          // highlightColor: Colors.black.withOpacity(0.1),
        ));
  }

  Widget _buildTitle(int i) {
    return InkWell(
      onTap: () async {
        print(i);
        if (i == 0) {
          // _sscrollToIndex(i);
          Scrollable.ensureVisible(dataKey.currentContext!);
        } else {
          _scrollToIndex(i);
        }

        setState(() {
          selectedButton = i;
        });
      },
      onHover: (t) {
        if (t) {
          setState(() {
            currentButton = i;
          });
        }
        if (!t) {
          setState(() {
            currentButton = null;
          });
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
                    color: selectedButton == i || currentButton == i
                        ? Colors.pink
                        : titleColor,
                    fontSize: 16),
                duration: Duration(milliseconds: 400)),
          )),
    );
  }

  _buildSliverAppbar() {
    final size = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      // brightness: Brightness.light,
      pinned: true,
      expandedHeight: size,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background:
            // _wrapScrollTag(
            //   index: 0,
            //   child:
            Container(
          child: WelcomePage(scrollTo: _scrollToIndex),
          key: dataKey,
          // ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: isExpaned ? 0.0 : 1,
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
                        for (var i = 0; i < titles.length; i++) _buildTitle(i)
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        controller: _autoScrollController,
        slivers: <Widget>[
          _buildSliverAppbar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _wrapScrollTag(
                    index: 1,
                    child: AboutScreen(
                      height: size - kToolbarHeight,
                      scroll: _scrollToIndex,
                    )),
                _wrapScrollTag(
                    index: 2,
                    child: ProjectScreen(
                      height: size - kToolbarHeight,
                    )),
                _wrapScrollTag(
                    index: 3,
                    child: BlogScreen(
                      height: size - kToolbarHeight,
                    )),
                _wrapScrollTag(
                  index: 4,
                  child: ContactScreen(
                    height: size - kToolbarHeight,
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
