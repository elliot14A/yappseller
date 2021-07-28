// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../pages/add_new_item_page.dart' as _i6;
import '../pages/logo_screen.dart' as _i3;
import '../pages/main_screen.dart' as _i5;
import '../pages/signup.dart' as _i7;
import '../pages/welcome.dart' as _i4;

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
    WelcomeRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.Welcome();
        },
        opaque: true,
        barrierDismissible: false),
    MainScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<MainScreenRouteArgs>(
              orElse: () => const MainScreenRouteArgs());
          return _i5.MainScreen(key: args.key);
        },
        opaque: true,
        barrierDismissible: false),
    AddNewItemRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<AddNewItemRouteArgs>(
              orElse: () => const AddNewItemRouteArgs());
          return _i6.AddNewItem(key: args.key);
        },
        transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 100,
        opaque: true,
        barrierDismissible: false),
    SignUpRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i7.SignUp();
        },
        transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 700,
        opaque: true,
        barrierDismissible: false)
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LogoRoute.name, path: '/'),
        _i1.RouteConfig(WelcomeRoute.name, path: '/Welcome'),
        _i1.RouteConfig(MainScreenRoute.name, path: '/main-screen'),
        _i1.RouteConfig(AddNewItemRoute.name, path: '/add-new-item'),
        _i1.RouteConfig(SignUpRoute.name, path: '/sign-up')
      ];
}

class LogoRoute extends _i1.PageRouteInfo {
  const LogoRoute() : super(name, path: '/');

  static const String name = 'LogoRoute';
}

class WelcomeRoute extends _i1.PageRouteInfo {
  const WelcomeRoute() : super(name, path: '/Welcome');

  static const String name = 'WelcomeRoute';
}

class MainScreenRoute extends _i1.PageRouteInfo<MainScreenRouteArgs> {
  MainScreenRoute({_i2.Key? key})
      : super(name, path: '/main-screen', args: MainScreenRouteArgs(key: key));

  static const String name = 'MainScreenRoute';
}

class MainScreenRouteArgs {
  const MainScreenRouteArgs({this.key});

  final _i2.Key? key;
}

class AddNewItemRoute extends _i1.PageRouteInfo<AddNewItemRouteArgs> {
  AddNewItemRoute({_i2.Key? key})
      : super(name, path: '/add-new-item', args: AddNewItemRouteArgs(key: key));

  static const String name = 'AddNewItemRoute';
}

class AddNewItemRouteArgs {
  const AddNewItemRouteArgs({this.key});

  final _i2.Key? key;
}

class SignUpRoute extends _i1.PageRouteInfo {
  const SignUpRoute() : super(name, path: '/sign-up');

  static const String name = 'SignUpRoute';
}
