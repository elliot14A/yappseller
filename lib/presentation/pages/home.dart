import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yappadmin/application/auth/auth_state_controller.dart';
import 'package:auto_route/auto_route.dart';
import 'package:yappadmin/presentation/constants/color_constants.dart';
import 'package:yappadmin/presentation/routes/router.gr.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    return Scaffold(
        body: Center(
          child: Text('Home'),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'tick',
          onPressed: () {
            context.read(authStateProvider.notifier).signOut();
            context.router.replace(SignUpRoute());
          },
          backgroundColor: kAccentColor,
          child: Icon(Icons.login),
        ));
  }
}
