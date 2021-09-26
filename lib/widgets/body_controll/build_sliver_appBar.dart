import 'package:basil_personal_web/providers/body_controll_manage.dart';
import 'package:basil_personal_web/sections/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';

import 'custom_titles.dart';

class BuildSliverAppBAr extends StatelessWidget {
  BuildSliverAppBAr({
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
  Widget buildText(String title, BuildContext context, int i) {
    final manage = Provider.of<BodyControllManager>(context);
    final falamanage = Provider.of<BodyControllManager>(context, listen: false);
    return InkWell(
      onTap: () async {
        if (i == 0) {
          await goToHome();
        } else {
          scrollToIndex!(i);
        }
        falamanage.setselectedButton(i);
        falamanage.setisisTaped();
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
      key: ValueKey('aaaaaau'),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      pinned: true,
      expandedHeight: size,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Container(
          child: WelcomePage(
            scrollTo: scrollToIndex,
            key: ValueKey('aaaaaav'),
          ),
          key: dataKey,
        ),
      ),
      bottom: PreferredSize(
        key: ValueKey('aaaaaaw'),
        preferredSize: Size(width, manage.isTaped ? 180 : 0),
        child: AnimatedOpacity(
          key: ValueKey('aaaaaax'),
          duration: Duration(milliseconds: 500),
          opacity: manage.isExpaned ? 0.0 : 1,
          child: Container(
            key: ValueKey('aaaaaay'),
            alignment: Alignment.topRight,
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(0),
            color: Color(0xFF1B242F),
            child: Column(
              key: ValueKey('aaaaaaz'),
              crossAxisAlignment: width < 600
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                FittedBox(
                  key: ValueKey('aaaaaaaa'),
                  child: Container(
                    // height: 75,
                    key: ValueKey('aaaaaaab'),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      key: ValueKey('aaaaaaac'),
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (width > 1300)
                          SizedBox(
                            key: ValueKey('aaaaaaad'),
                            width: width * .15,
                          ),
                        if (width < 600)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            height: 53,
                            child: IconButton(
                                onPressed: () {
                                  falmanage.setisisTaped();
                                  // Scaffold.of(cntxt).openEndDrawer();
                                },
                                icon: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                  size: 40,
                                )),
                          ),
                        if (width > 600)
                          for (var i = 0; i < titles!.length; i++)
                            CustomTitles(
                              key: ValueKey('aaaaaaae$i'),
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
                  key: ValueKey('aaaaaaaf'),
                  width: double.infinity,
                  height: 3,
                  color: Color(0xff04c2c9),
                ),
                if (width < 600)
                  AnimatedContainer(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      color: Color(0xff333333),
                      height: manage.isTaped ? 180 : 0,
                      width: width,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildText('Home', context, 0),
                            SizedBox(height: 13),
                            buildText('About', context, 1),
                            SizedBox(height: 13),
                            buildText('PortFolio', context, 2),
                            SizedBox(height: 13),
                            buildText('Blog', context, 3),
                            SizedBox(height: 13),
                            buildText('Contact', context, 4),
                          ],
                        ),
                      ),
                      duration: Duration(milliseconds: 300))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
