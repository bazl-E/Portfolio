// import 'package:basil_personal_web/sections/ex.dart';
// import 'package:basil_personal_web/sections/sliverappbar.dart';
import 'package:basil_personal_web/helper/body_controll.dart';
import 'package:flutter/material.dart';
// import 'package:responsive_framework/responsive_wrapper.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [routeObserver],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      // routes: {
      //   '/': (ctx) => WelcomePage(),
      // },
      home: BodyController(),
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
  }
}
