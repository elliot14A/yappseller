import 'package:flutter/material.dart';
import 'package:yappadmin/presentation/constants/color_constants.dart';
import 'package:yappadmin/presentation/widgets/shadow.dart';

Widget logo(BuildContext context) {
  return Hero(
    tag: 'logo',
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
