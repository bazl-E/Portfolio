import 'package:basil_personal_web/helper/body_controll.dart';
import 'package:basil_personal_web/providers/about_screen_manager.dart';
import 'package:basil_personal_web/providers/blog_screen_manage.dart';
import 'package:basil_personal_web/providers/body_controll_manage.dart';
import 'package:basil_personal_web/providers/contact_screen_manager.dart';
import 'package:basil_personal_web/providers/project_screen_manage.dart';

import 'package:basil_personal_web/providers/welcome_screen_manage.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:url_strategy/url_strategy.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
void main() {
  setPathUrlStrategy();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(MyApp(
    key: UniqueKey(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      key: const ValueKey('aaaaaaaaaaaq'),
      providers: [
        ChangeNotifierProvider<WelcomescreenManager>(
          key: const ValueKey('aaaaaaaaaaar'),
          create: (_) => WelcomescreenManager(),
        ),
        ChangeNotifierProvider<ProjectcreenManager>(
          key: const ValueKey('aaaaaaaaaaas'),
          create: (_) => ProjectcreenManager(),
        ),
        ChangeNotifierProvider<BlogscreenManager>(
          key: const ValueKey('aaaaaaaaaaat'),
          create: (_) => BlogscreenManager(),
        ),
        ChangeNotifierProvider<ContactscreenManager>(
          key: const ValueKey('aaaaaaaaaaau'),
          create: (_) => ContactscreenManager(),
        ),
        ChangeNotifierProvider<BodyControllManager>(
          key: const ValueKey('aaaaaaaaaaav'),
          create: (_) => BodyControllManager(),
        ),
        ChangeNotifierProvider<AboutscreenManager>(
          key: const ValueKey('aaaaaaaaaaaw'),
          create: (_) => AboutscreenManager(),
        ),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
            key: const ValueKey('aaaaaaaaaaax'),
            debugShowCheckedModeBanner: false,
            title: 'Findbasilprofilo',
            theme: ThemeData(
              primarySwatch: Colors.amber,
            ),
            home: SplashScreenView(
              navigateRoute: const BodyController(),
              duration: 3000,
              imageSize: 130,
              imageSrc: "assets/bazi.png",
              text: "Packing....",
              textType: TextType.TyperAnimatedText,
              textStyle: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: Colors.white,
            ));
      }),
    );
  }
}
