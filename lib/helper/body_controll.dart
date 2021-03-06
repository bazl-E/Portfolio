import 'package:basil_personal_web/providers/body_controll_manage.dart';
import 'package:basil_personal_web/sections/about_screen.dart';
import 'package:basil_personal_web/sections/blog_scree.dart';
import 'package:basil_personal_web/sections/contact_screen.dart';
import 'package:basil_personal_web/sections/project_screen.dart';
// import 'package:basil_personal_web/widgets/body_controll/build-sliver_appBar.dart';
import 'package:basil_personal_web/widgets/body_controll/build_sliver_appBar.dart';
import 'package:basil_personal_web/widgets/body_controll/wrap_scroll_tag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class BodyController extends StatefulWidget {
  const BodyController({
    Key? key,
  }) : super(key: key);
  @override
  _BodyControllerState createState() => _BodyControllerState();
}

class _BodyControllerState extends State<BodyController>
    with SingleTickerProviderStateMixin {
  AutoScrollController? _autoScrollController;

  final scrollDirection = Axis.vertical;

  final dataKey = GlobalKey();
  final scfKey = GlobalKey<ScaffoldState>();

  final List<String> titles = [
    'HOME',
    'ABOUT',
    'PORTFOLIO',
    'BLOG',
    'CONTACT',
  ];

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
      _autoScrollController!.addListener(
        () => _isAppBarExpanded
            ? manage.isExpaned != false
                ? falmanage.setisisExpaned(false)
                : {}
            : manage.isExpaned != true
                ? falmanage.setisisExpaned(true)
                : {},
      );
    });

    super.initState();
  }

  Future _scrollToIndex(int index) async {
    await _autoScrollController!.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin,
        duration: const Duration(milliseconds: 500));
  }

  // void showDrawer() {
  //   Scaffold.of(context).openEndDrawer();
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scfKey,
      // endDrawer: Drawer(),
      // key: ValueKey('a'),
      body: CustomScrollView(
        shrinkWrap: true,
        controller: _autoScrollController,
        slivers: <Widget>[
          BuildSliverAppBAr(
            // drawerKey: scfKey,
            key: const ValueKey('b'),
            goToHome: goToHome,
            scrollToIndex: _scrollToIndex,
            titles: titles,
            dataKey: dataKey,
            cntxt: context,
          ),
          SliverList(
            key: const ValueKey('c'),
            delegate: SliverChildListDelegate(
              [
                WrapScrollTag(
                    key: const ValueKey('d'),
                    autoScrollController: _autoScrollController,
                    index: 1,
                    child: AboutScreen(
                      height: size - kToolbarHeight,
                      scroll: _scrollToIndex,
                    )),
                WrapScrollTag(
                    key: const ValueKey('e'),
                    autoScrollController: _autoScrollController,
                    index: 2,
                    child: ProjectScreen(
                      key: const ValueKey('f'),
                      height: size - kToolbarHeight,
                    )),
                WrapScrollTag(
                    key: const ValueKey('g'),
                    autoScrollController: _autoScrollController,
                    index: 3,
                    child: BlogScreen(
                      key: const ValueKey('h'),
                      height: size - kToolbarHeight,
                    )),
                WrapScrollTag(
                  key: const ValueKey('i'),
                  autoScrollController: _autoScrollController,
                  index: 4,
                  child: ContactScreen(
                    key: const ValueKey('j'),
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
