import 'package:basil_personal_web/providers/body_controll_manage.dart';
import 'package:basil_personal_web/sections/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'custom_titles.dart';

class BuildSliverAppBAr extends StatefulWidget {
  const BuildSliverAppBAr({
    Key? key,
    required this.scrollToIndex,
    required this.titles,
    required this.dataKey,
    required this.goToHome,
    required this.cntxt,
    // required this.openDrwr,
  }) : super(key: key);
  final Future Function(int i)? scrollToIndex;
  final List<String>? titles;
  final Function goToHome;
  final BuildContext cntxt;
  // final VoidCallback openDrwr;
  // final List<String> titles;

  final GlobalKey dataKey;

  @override
  State<BuildSliverAppBAr> createState() => _BuildSliverAppBArState();
}

class _BuildSliverAppBArState extends State<BuildSliverAppBAr>
    with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<Size>? sizeAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 350));
    sizeAnimation = Tween<Size>(
            begin: const Size(double.infinity, 0),
            end: const Size(double.infinity, 180))
        .animate(CurvedAnimation(parent: controller!, curve: Curves.easeIn));
  }

  Widget buildText(String title, int i) {
    final manage = Provider.of<BodyControllManager>(context);
    final falamanage = Provider.of<BodyControllManager>(context, listen: false);
    return InkWell(
      onTap: () async {
        falamanage.setselectedButton(i);
        falamanage.setisisTaped();
        if (i == 0) {
          await widget.goToHome();
        } else {
          widget.scrollToIndex!(i);
        }
        // falamanage.setselectedButton(i);
        // falamanage.setisisTaped();
      },
      onHover: (t) {
        if (t) {
          falamanage.setcurrentButton(i);
        }
        if (!t) {
          falamanage.setcurrentButton(null);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title,
          style: GoogleFonts.raleway(
              color: manage.selectedButton == i || manage.currentButton == i
                  ? Colors.pink
                  : Colors.white,
              fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final manage = Provider.of<BodyControllManager>(context);
    final falmanage = Provider.of<BodyControllManager>(context, listen: false);
    return SliverAppBar(
      key: const ValueKey('aaaaaau'),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      pinned: true,
      expandedHeight: size,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Container(
          child: WelcomePage(
            scrollTo: widget.scrollToIndex,
            key: const ValueKey('aaaaaav'),
          ),
          key: widget.dataKey,
        ),
      ),
      bottom: PreferredSize(
        key: const ValueKey('aaaaaaw'),
        preferredSize: Size(width, manage.isTaped ? 180 : 0),
        child: AnimatedOpacity(
          key: const ValueKey('aaaaaax'),
          duration: const Duration(milliseconds: 500),
          opacity: manage.isExpaned ? 0.0 : 1,
          child: Container(
            key: const ValueKey('aaaaaay'),
            alignment: Alignment.topRight,
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.all(0),
            color: const Color(0xFF1B242F),
            child: Column(
              key: const ValueKey('aaaaaaz'),
              crossAxisAlignment: width < 600
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                FittedBox(
                  key: const ValueKey('aaaaaaaa'),
                  child: Container(
                    // height: 75,
                    key: const ValueKey('aaaaaaab'),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      key: const ValueKey('aaaaaaac'),
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (width > 1300)
                          SizedBox(
                            key: const ValueKey('aaaaaaad'),
                            width: width * .15,
                          ),
                        if (width < 600)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            height: 53,
                            child: IconButton(
                                onPressed: () {
                                  falmanage.setisisTaped();
                                  // Scaffold.of(cntxt).openEndDrawer();
                                },
                                icon: const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                  size: 40,
                                )),
                          ),
                        if (width > 600)
                          for (var i = 0; i < widget.titles!.length; i++)
                            CustomTitles(
                              key: ValueKey('aaaaaaae$i'),
                              i: i,
                              scrollToIndex: widget.scrollToIndex,
                              goToHome: widget.goToHome,
                              titles: widget.titles!,
                            )
                      ],
                    ),
                  ),
                ),
                Container(
                  key: const ValueKey('aaaaaaaf'),
                  width: double.infinity,
                  height: 3,
                  color: const Color(0xff04c2c9),
                ),
                if (width < 600)
                  AnimatedContainer(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      color: const Color(0xff333333),
                      height: manage.isTaped ? 180 : 0,
                      width: width,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildText('Home', 0),
                            const SizedBox(height: 13),
                            buildText('About', 1),
                            const SizedBox(height: 13),
                            buildText('PortFolio', 2),
                            const SizedBox(height: 13),
                            buildText('Blog', 3),
                            const SizedBox(height: 13),
                            buildText('Contact', 4),
                          ],
                        ),
                      ),
                      duration: const Duration(milliseconds: 300)),
                // SizeTransition(sizeFactor:sizeAnimation )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
