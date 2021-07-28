import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yappadmin/presentation/pages/edit.dart';
import 'package:yappadmin/presentation/pages/home.dart';
import 'package:yappadmin/presentation/pages/notifs.dart';
import 'package:yappadmin/presentation/pages/settings.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final pageController = PageController();
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      PageView(
        controller: pageController,
        //reverse: true,
        onPageChanged: (page) {
          setState(() {
            selectedPage = page;
          });
        },
        children: [
          Home(),
          Edit(),
          Notifs(),
          Settings(),
        ],
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color(0x00000029).withAlpha(30),
                offset: Offset(0, 2),
                blurRadius: 6,
                spreadRadius: 1)
          ],
        ),
        margin: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.height * 0.03,
            MediaQuery.of(context).size.height * 0.890,
            MediaQuery.of(context).size.height * 0.03,
            MediaQuery.of(context).size.height * 0.025),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.10,
                height: MediaQuery.of(context).size.height * 0.04,
                child: GestureDetector(
                  child: SvgPicture.asset(
                    selectedPage == 0
                        ? 'assets/images/home.svg'
                        : 'assets/images/home-outline.svg',
                  ),
                  onTap: () {
                    pageController.animateToPage(0,
                        curve: Curves.fastOutSlowIn,
                        duration: Duration(milliseconds: 100));
                    setState(
                      () {
                        selectedPage = 0;
                      },
                    );
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.10,
                height: MediaQuery.of(context).size.height * 0.04,
                child: GestureDetector(
                  child: SvgPicture.asset(
                    selectedPage == 1
                        ? 'assets/images/edit.svg'
                        : 'assets/images/edit-outline.svg',
                    fit: BoxFit.contain,
                  ),
                  onTap: () {
                    pageController.animateToPage(1,
                        curve: Curves.fastOutSlowIn,
                        duration: Duration(milliseconds: 100));
                    setState(
                      () {
                        selectedPage = 1;
                      },
                    );
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.10,
                height: MediaQuery.of(context).size.height * 0.04,
                child: GestureDetector(
                  child: SvgPicture.asset(
                    selectedPage == 2
                        ? 'assets/images/bell.svg'
                        : 'assets/images/bell-outline.svg',
                  ),
                  onTap: () {
                    pageController.animateToPage(2,
                        curve: Curves.fastOutSlowIn,
                        duration: Duration(milliseconds: 100));
                    setState(
                      () {
                        selectedPage = 2;
                      },
                    );
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.10,
                height: MediaQuery.of(context).size.height * 0.04,
                child: GestureDetector(
                  child: SvgPicture.asset(
                    selectedPage == 3
                        ? 'assets/images/settings.svg'
                        : 'assets/images/settings-outline.svg',
                  ),
                  onTap: () {
                    pageController.animateToPage(3,
                        curve: Curves.fastOutSlowIn,
                        duration: Duration(milliseconds: 100));
                    setState(
                      () {
                        selectedPage = 3;
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ]));
  }
}
