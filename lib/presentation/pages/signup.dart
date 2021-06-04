import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:yappadmin/presentation/constants/color_constants.dart';
import 'package:yappadmin/presentation/routes/router.gr.dart';
import 'package:yappadmin/presentation/widgets/logo.dart';
import 'package:yappadmin/presentation/widgets/shadow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_route/auto_route.dart';
import 'dart:math';

class SignUp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBGColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          logo(context),
          const SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: shadow()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(
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
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    context.router.push(WelcomeRoute());
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: 50,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: kAccentColor.withOpacity(0.5),
                              blurRadius: 6,
                              offset: Offset(-2, 2))
                        ],
                        color: kAccentColor,
                        borderRadius: BorderRadius.circular(40)),
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
                        SizedBox(
                          child: Hero(
                            tag: 'tick',
                            flightShuttleBuilder: (flightContext,
                                animation,
                                flightDirection,
                                fromHeroContext,
                                toHeroContext) {
                              final curvedAnim = CurvedAnimation(
                                  parent: animation, curve: Curves.easeInExpo);
                              return RotationTransition(
                                turns: curvedAnim,
                                child: toHeroContext.widget,
                              );
                            },
                            child: SizedBox(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text("Let's get you signed in",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 58,
                          width: 54,
                          child: Transform.rotate(
                              angle: pi / 2,
                              child: SvgPicture.asset(
                                'assets/images/undo-outline.svg',
                                color: kAccentColor,
                                fit: BoxFit.fill,
                              )),
                        ),
                      ],
                    )
                  ],
                ))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.only(left: 10),
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
              child: SvgPicture.asset(
                  'assets/images/undraw_pair_programming_njlp.svg'))
        ],
      ),
    );
  }
}
