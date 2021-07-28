import 'package:auto_route/auto_route.dart';
import 'package:yappadmin/presentation/pages/add_new_item_page.dart';
import 'package:yappadmin/presentation/pages/logo_screen.dart';
import 'package:yappadmin/presentation/pages/main_screen.dart';
import 'package:yappadmin/presentation/pages/signup.dart';
import 'package:yappadmin/presentation/pages/welcome.dart';

@MaterialAutoRouter(routes: [
  CustomRoute(
    page: Logo,
    initial: true,
  ),
  CustomRoute(
    page: Welcome,
  ),
  CustomRoute(
    page: MainScreen,
  ),
  CustomRoute(
      page: AddNewItem,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100),
  CustomRoute(
      page: SignUp,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 700),
])
class $AppRouter {}
