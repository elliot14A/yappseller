import 'package:auto_route/auto_route.dart';
import 'package:yappadmin/presentation/pages/home.dart';
import 'package:yappadmin/presentation/pages/logo_screen.dart';
import 'package:yappadmin/presentation/pages/signup.dart';
import 'package:yappadmin/presentation/pages/welcome.dart';

@MaterialAutoRouter(routes: [
  CustomRoute(
    page: Logo,
    initial: true,
  ),
  CustomRoute(page: SignUp, durationInMilliseconds: 500),
  CustomRoute(page: Home, transitionsBuilder: TransitionsBuilders.fadeIn),
  CustomRoute(
    page: Welcome,
  )
])
class $AppRouter {}
