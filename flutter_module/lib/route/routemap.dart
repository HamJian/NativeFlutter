 import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

import '../pages/home.dart';

Map<String, FlutterBoostRouteFactory> routerMap = {
  '/': (RouteSettings settings, String? uniqueId) {
    return MaterialPageRoute(
        settings: settings,
        builder: (_) {
          return const HomePage(
            title: "主页",
          );
        });
  },
  'homepage': (RouteSettings settings, String? uniqueId) {
    return MaterialPageRoute(
        settings: settings,
        builder: (_) {
          return const HomePage(
            title: "ss主页",
          );
        });
  },
};

 Route<dynamic>? routeFactory(RouteSettings settings, String? uniqueId) {
   FlutterBoostRouteFactory? func = routerMap[settings.name];
   if (func == null) return null;
   return func!(settings, uniqueId);
 }