import 'package:flutter/cupertino.dart';
import 'package:yappadmin/presentation/constants/color_constants.dart';

List<BoxShadow> shadow() {
  return [
    BoxShadow(
        offset: Offset(6, 6),
        blurRadius: 6,
        color: kDropShadowColor.withAlpha(10))
  ];
}
