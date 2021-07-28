import 'package:flutter/material.dart';
import 'package:yappadmin/application/auth/auth_state_controller.dart';
import 'package:yappadmin/presentation/constants/color_constants.dart';
import 'package:yappadmin/presentation/routes/router.gr.dart';
import 'package:yappadmin/presentation/widgets/logo.dart';
import 'package:yappadmin/presentation/widgets/shadow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBGColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            logo(context),
            _SignInContainer(),
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(10),
                  //height: MediaQuery.of(context).size.height / 4,
                  width: double.infinity,
                  child: SvgPicture.asset(
                      'assets/images/undraw_pair_programming_njlp.svg')),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignInContainer extends StatelessWidget {
  const _SignInContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: shadow()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hey',
                  style: TextStyle(
                      color: kAccentColor,
                      fontFamily: 'Roboto',
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Admin!',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          _SignInButton(),
          const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 30,
              ),
              Text("Let's get you signed in",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 58,
                width: 54,
                child: Transform.rotate(
                    angle: pi / 2,
                    child: SvgPicture.asset(
                      'assets/images/undo-outline.svg',
                      color: kAccentColor,
                      fit: BoxFit.contain,
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context.read(authStateProvider.notifier).signIn().then((value) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: kAccentColor,
              padding: EdgeInsets.zero,
              content: value.fold(
                  (l) => Text(
                        l.map(
                            cancelledByUser: (_) => "cancelled by user",
                            networkError: (_) => "network error",
                            serverError: (_) => "server error"),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, fontFamily: "Roboto"),
                      ), (r) {
                context.read(authStateProvider.notifier).registerUser().then(
                    (value) => value
                        ? context.router.replace(MainScreenRoute())
                        : context.router.replace(WelcomeRoute()));
                return Row(
                  children: [
                    const SizedBox(width: 20),
                    CircularProgressIndicator.adaptive(),
                    const SizedBox(
                      width: 70,
                    ),
                    Text(
                      'Sit Tight Logging You In',
                      style: TextStyle(fontSize: 20, fontFamily: "Roboto"),
                    )
                  ],
                );
              })));
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.3,
        height: 50,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: kAccentColor.withOpacity(0.3),
              blurRadius: 6,
              offset: Offset(-2, 2))
        ], color: kAccentColor, borderRadius: BorderRadius.circular(40)),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 5,
            ),
            SvgPicture.asset(
              'assets/images/google.svg',
              color: kPrimaryColor,
              fit: BoxFit.cover,
              height: 36,
              width: 38,
            ),
            Expanded(
                child: Center(
                    child: Text(
              'SignIn With Google',
              style: TextStyle(
                  fontSize: 24,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold),
            ))),
            const SizedBox(
              width: 10,
            ),
            _HeroAnimation()
          ],
        ),
      ),
    );
  }
}

class _HeroAnimation extends StatelessWidget {
  const _HeroAnimation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Hero(
        tag: 'tick',
        flightShuttleBuilder: (flightContext, animation, flightDirection,
            fromHeroContext, toHeroContext) {
          final curvedAnim =
              CurvedAnimation(parent: animation, curve: Curves.easeInExpo);
          return RotationTransition(
            turns: curvedAnim,
            child: toHeroContext.widget,
          );
        },
        child: SizedBox(),
      ),
    );
  }
}
