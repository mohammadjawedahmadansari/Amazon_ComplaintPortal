import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'Pages/Dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
//      DeviceOrientation.landscapeLeft,
//      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context,widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context,widget!),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450,name: MOBILE),
          ResponsiveBreakpoint.autoScale(800,name: TABLET),
          ResponsiveBreakpoint.autoScale(1000,name: TABLET),
          ResponsiveBreakpoint.resize(1200,name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460,name: "4K"),
        ],
      ),
      home:Dashboard(),
    );
  }
}
