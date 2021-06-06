// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../pages/home.dart' as _i5;
import '../pages/logo_screen.dart' as _i3;
import '../pages/signup.dart' as _i4;
import '../pages/welcome.dart' as _i6;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LogoRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.Logo();
        },
        opaque: true,
        barrierDismissible: false),
    SignUpRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.SignUp();
        },
        opaque: true,
        barrierDismissible: false),
    HomeRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.Home();
        },
        transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false),
    WelcomeRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.Welcome();
        },
        opaque: true,
        barrierDismissible: false)
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LogoRoute.name, path: '/'),
        _i1.RouteConfig(SignUpRoute.name, path: '/sign-up'),
        _i1.RouteConfig(HomeRoute.name, path: '/Home'),
        _i1.RouteConfig(WelcomeRoute.name, path: '/Welcome')
      ];
}

class LogoRoute extends _i1.PageRouteInfo {
  const LogoRoute() : super(name, path: '/');

  static const String name = 'LogoRoute';
}

class SignUpRoute extends _i1.PageRouteInfo {
  const SignUpRoute() : super(name, path: '/sign-up');

  static const String name = 'SignUpRoute';
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/Home');

  static const String name = 'HomeRoute';
}

class WelcomeRoute extends _i1.PageRouteInfo {
  const WelcomeRoute() : super(name, path: '/Welcome');

  static const String name = 'WelcomeRoute';
}
