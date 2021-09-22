import 'package:basil_personal_web/providers/body_controll_manage.dart';
import 'package:basil_personal_web/sections/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'custom_titles.dart';

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
        preferredSize: Size.fromHeight(0),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                FittedBox(
                  key: ValueKey('aaaaaaaa'),
                  child: Container(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
