import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:yappadmin/presentation/constants/color_constants.dart';
import 'package:yappadmin/presentation/routes/router.gr.dart';
import 'package:yappadmin/presentation/widgets/logo.dart';
import 'package:auto_route/auto_route.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      context.router.push(HomeRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          logo(context),
          const SizedBox(
            height: 63,
          ),
          Text(
            "You're all good to go",
            style: TextStyle(
                color: kAccentColor, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 80,
          ),
          Center(
            child: Container(
              height: 62,
              width: 62,
              child: Hero(
                tag: 'tick',
                child: SvgPicture.asset(
                  'assets/images/checkmark-circle-outline.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.all(10),
            child: SvgPicture.asset(
                'assets/images/undraw_Order_confirmed_re_g0if.svg'),
          ))
        ],
      ),
    );
  }
}
