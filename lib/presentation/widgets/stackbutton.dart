import 'package:flutter/material.dart';
import 'package:yappadmin/presentation/constants/color_constants.dart';

// ignore: non_constant_identifier_names
Positioned UpdateButton(BuildContext context, String title) {
  return Positioned(
    bottom: -18,
    child: Container(
        height: 42,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: kAccentColor),
        child: Center(
          child:
              Text(title, style: TextStyle(fontSize: 20, color: Colors.white)),
        )),
  );
}
