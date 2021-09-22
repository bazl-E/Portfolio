// import 'package:basil_personal_web/sections/ex.dart';
// import 'package:basil_personal_web/sections/sliverappbar.dart';
import 'package:basil_personal_web/helper/body_controll.dart';
import 'package:basil_personal_web/providers/about_screen_manager.dart';
import 'package:basil_personal_web/providers/blog_screen_manage.dart';
import 'package:basil_personal_web/providers/body_controll_manage.dart';
import 'package:basil_personal_web/providers/contact_screen_manager.dart';
import 'package:basil_personal_web/providers/project_screen_manage.dart';

import 'package:basil_personal_web/providers/welcome_screen_manage.dart';
import 'package:flutter/cupertino.dart';
// import 'package:basil_personal_web/sections/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:url_strategy/url_strategy.dart';
// import 'package:responsive_framework/responsive_wrapper.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      key: ValueKey('aaaaaaaaaaaq'),
      providers: [
        ChangeNotifierProvider<WelcomescreenManager>(
          key: ValueKey('aaaaaaaaaaar'),
          create: (_) => WelcomescreenManager(),
        ),
        ChangeNotifierProvider<ProjectcreenManager>(
          key: ValueKey('aaaaaaaaaaas'),
          create: (_) => ProjectcreenManager(),
        ),
        ChangeNotifierProvider<BlogscreenManager>(
          key: ValueKey('aaaaaaaaaaat'),
          create: (_) => BlogscreenManager(),
        ),
        ChangeNotifierProvider<ContactscreenManager>(
          key: ValueKey('aaaaaaaaaaau'),
          create: (_) => ContactscreenManager(),
        ),
        ChangeNotifierProvider<BodyControllManager>(
          key: ValueKey('aaaaaaaaaaav'),
          create: (_) => BodyControllManager(),
        ),
        ChangeNotifierProvider<AboutscreenManager>(
          key: ValueKey('aaaaaaaaaaaw'),
          create: (_) => AboutscreenManager(),
        ),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
            key: ValueKey('aaaaaaaaaaax'),
            // navigatorObservers: [routeObserver],
            debugShowCheckedModeBanner: false,
            title: 'Findbasilprofilo',
            theme: ThemeData(
              primarySwatch: Colors.amber,
            ),
            // routes: {
            // '/': (ctx) => WelcomePage(),
            // WelcomePage.routeName: (ctx) => WelcomePage(),
            // },
            home: SplashScreenView(
              navigateRoute: BodyController(),
              duration: 3000,
              imageSize: 130,
              imageSrc: "assets/bazi.png",
              text: "Packing....",
              textType: TextType.TyperAnimatedText,
              textStyle: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: Colors.white,
            )

            // builder: (context, widget) => ResponsiveWrapper.builder(WelcomePage(),
            //     maxWidth: 2000,
            //     minWidth: 480,
            //     defaultScale: true,
            //     breakpoints: [
            //       ResponsiveBreakpoint.resize(480, name: MOBILE),
            //       ResponsiveBreakpoint.autoScale(800, name: TABLET),
            //       ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            //     ],
            //     background: Container(color: Color(0xFFF5F5F5))),
            // initialRoute: "/",
            );
      }),
    );
  }
}
