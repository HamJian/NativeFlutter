import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/route/routemap.dart';

void main() {
  ///添加全局生命周期监听类
  PageVisibilityBinding.instance.addGlobalObserver(AppLifecycleObserver());
  CustomFlutterBinding();
  runApp(const MyApp());
}

class CustomFlutterBinding extends WidgetsFlutterBinding with BoostFlutterBinding {}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Widget appBuilder(Widget home) {
    return MaterialApp(
      home: home,
      debugShowCheckedModeBanner: true,
      builder: (_, __) {
        return home;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(
      routeFactory,
      appBuilder: appBuilder,
    );
  }
}

///全局生命周期监听
class AppLifecycleObserver with GlobalPageVisibilityObserver {
  @override
  void onBackground(Route route) {
    super.onBackground(route);
    print("AppLifecycleObserver - onBackground：${route.settings.name}");
  }

  @override
  void onForeground(Route route) {
    super.onForeground(route);
    print("AppLifecycleObserver - onForground：${route.settings.name}");
  }

  /// 对标Android onCreate
  @override
  void onPagePush(Route route) {
    super.onPagePush(route);
    print("AppLifecycleObserver - onPagePush：${route.settings.name}");
  }

  /// 对标Android onDestroy
  @override
  void onPagePop(Route route) {
    super.onPagePop(route);
    print("AppLifecycleObserver - onPagePop：${route.settings.name}");
  }

  /// 对标Android onStop
  @override
  void onPageHide(Route route) {
    super.onPageHide(route);
    print("AppLifecycleObserver - onPageHide：${route.settings.name}");
  }

  /// 对标Android onResume
  @override
  void onPageShow(Route route) {
    super.onPageShow(route);
    print("AppLifecycleObserver - onPageShow：${route.settings.name}");
  }
}