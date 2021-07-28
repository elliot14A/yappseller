import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yappadmin/application/auth/auth_state_controller.dart';
import 'package:auto_route/auto_route.dart';
import 'package:yappadmin/presentation/constants/color_constants.dart';
import 'package:yappadmin/presentation/routes/router.gr.dart';
import 'package:yappadmin/presentation/widgets/category_list.dart';
import 'package:yappadmin/presentation/widgets/item_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final focusNode = FocusNode();
  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Stack(
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Column(
                        children: [
                          Container(
                            height:
                                MediaQuery.of(context).size.height * 80 / 950,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0x00000029).withAlpha(30),
                                      offset: Offset(0, 2),
                                      blurRadius: 6,
                                      spreadRadius: 1)
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18)),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 6),
                              width: MediaQuery.of(context).size.width,
                              child: CategoryList()),
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: double.infinity,
                              child: ItemList(),
                            ),
                          )
                        ],
                      ),
                      _SearchBar(focusNode: focusNode),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom:
              focusNode.hasFocus ? 0 : MediaQuery.of(context).size.height * .09,
        ),
        child: Container(
          height: 100,
          width: 80,
          // margin: EdgeInsets.only(left: ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),

          child: Center(
            child: FloatingActionButton(
              heroTag: 'tick',
              onPressed: () {
                context.read(authStateProvider.notifier).signOut();
                context.router.replace(SignUpRoute());
              },
              backgroundColor: kAccentColor,
              child: Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchBar extends StatefulWidget {
  final FocusNode focusNode;
  const _SearchBar({Key? key, required this.focusNode}) : super(key: key);

  @override
  __SearchBarState createState() => __SearchBarState();
}

class __SearchBarState extends State<_SearchBar> {
  double? height;
  bool initial = false;
  String searchBoxText = "search";

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      height = MediaQuery.of(context).size.height * 31 / 950 + 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.focusNode.hasFocus) {
      height = MediaQuery.of(context).size.height / 3;
    } else {
      height = MediaQuery.of(context).size.height * 31 / 950 + 20;
    }
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.01,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.fastLinearToSlowEaseIn,
        height: height ?? MediaQuery.of(context).size.height * 31 / 950 + 20,
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kScaffoldBGColor,
            boxShadow: [
              BoxShadow(
                  color: Color(0x00000029).withAlpha(50),
                  offset: Offset(0, 4),
                  blurRadius: 6,
                  spreadRadius: 1)
            ]),
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.001,
              vertical: 0),
          child: TextField(
            focusNode: widget.focusNode,
            style: TextStyle(
              fontSize: 20,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, size: 32, color: Colors.black54),
              hintText: "Search",
              hintStyle: TextStyle().copyWith(
                letterSpacing: 2.0,
              ),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              //disabledBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
