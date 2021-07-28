import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yappadmin/application/auth/auth_state.dart';
import 'package:yappadmin/application/auth/auth_state_controller.dart';
import 'package:yappadmin/presentation/constants/color_constants.dart';
import 'package:yappadmin/presentation/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:yappadmin/presentation/widgets/logo.dart';

class Logo extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
        (_) => context.read(authStateProvider.notifier).authorize());
  }

  @override
  Widget build(BuildContext context) {
    return ProviderListener<AuthState>(
      provider: authStateProvider,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: kScaffoldBGColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),
                logo(context),
                SizedBox(
                  height: 100,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                    'Administrator',
                    style: TextStyle(
                        color: kAccentColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      onChange: (context, state) {
        state.map(
            initial: (_) {},
            authenticated: (_) async {
              await context.router.replace(MainScreenRoute());
            },
            notAuthenticated: (_) async {
              await context.router.replace(SignUpRoute());
            });
      },
    );
  }
}
