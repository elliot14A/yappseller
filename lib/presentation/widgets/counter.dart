import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yappadmin/presentation/constants/color_constants.dart';

class Counter extends StatefulWidget {
  final double height;
  final double width;
  const Counter({
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 6, offset: Offset(6, 6), color: Color(0x0f000099)),
        BoxShadow(
            blurRadius: 6, offset: Offset(-6, 6), color: Color(0x0f000099))
      ], color: kScaffoldBGColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              print("object");
            },
            child: SvgPicture.asset(
              "assets/images/minus-outline.svg",
            ),
          ),
          Text(
            "50",
            style: TextStyle(fontSize: 20),
          ),
          GestureDetector(
            onTap: () {
              print("object");
            },
            child: SvgPicture.asset(
              "assets/images/plus.svg",
              color: kAccentColor,
            ),
          ),
        ],
      ),
    );
  }
}
