import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yappadmin/presentation/constants/color_constants.dart';
import 'package:yappadmin/presentation/widgets/shadow.dart';

Widget logo(BuildContext context) {
  return Hero(
    tag: 'logo',
    flightShuttleBuilder: (flightContext, animation, flightDirection,
        fromHeroContext, toHeroContext) {
      final anim = CurvedAnimation(parent: animation, curve: Curves.easeIn);
      return AnimatedBuilder(
          animation: anim,
          child: toHeroContext.widget,
          builder: (context, child) {
            return child!;
          });
    },
    child: Container(
      height: MediaQuery.of(context).size.width / 3,
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
          color: kPrimaryColor, shape: BoxShape.circle, boxShadow: shadow()),
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Text(
            'Y',
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: MediaQuery.of(context).size.width / 3.1),
          ),
        ),
      ),
    ),
  );
}
