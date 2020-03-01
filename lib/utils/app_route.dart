import 'package:cobranza/screens/home_screen.dart';
import 'package:cobranza/screens/login_screen.dart';
import 'package:cobranza/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoute extends NavigatorObserver {
  AppRoute._internal();

  static final AppRoute _appRoute = AppRoute._internal();

  factory AppRoute() => _appRoute;

  static final Map<String, WidgetBuilder> _routes = {
    SplashPage.ROUTE_NAME: (_) => SplashPage(),
    LoginPage.ROUTE_NAME: (_) => LoginPage(),
    HomeScreen.ROUTE_NAME: (_) => HomeScreen(),
  };

  Map<String, WidgetBuilder> get routes => _routes;


  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic> previousRoute) {}

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {}

  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {}

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute.settings != null && previousRoute.settings.name != null) {
      setPreferredOrientations(previousRoute.settings);
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPush(route, previousRoute);
    if (route.settings != null && route.settings.name != null) {
      setPreferredOrientations(route.settings);
    }
  }

  void setPreferredOrientations(RouteSettings settings) {
  }
}

AppRoute appRoute = AppRoute();
