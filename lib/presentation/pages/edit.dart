import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yappadmin/presentation/constants/color_constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:yappadmin/presentation/routes/router.gr.dart';

class Edit extends StatefulWidget {
  Edit({Key? key}) : super(key: key);

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: null,
          title: Text("Add or Edit",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  fontSize: 24)),
          centerTitle: true,
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () async {
                await context.router.push(AddNewItemRoute());
              },
              child: Container(
                height: MediaQuery.of(context).size.height * .27,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: kAccentColor.withOpacity(0.5),
                          offset: Offset(2, 2),
                          blurRadius: 6)
                    ],
                    color: kAccentColor,
                    borderRadius: BorderRadius.circular(35)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Add new item",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * .3,
                      width: MediaQuery.of(context).size.width * .3,
                      child: SvgPicture.asset(
                        "assets/images/plus.svg",
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  print("tapped");
                },
                child: Container(
                    height: MediaQuery.of(context).size.height * .15,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Edit An Existing one",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.width * .1,
                          width: MediaQuery.of(context).size.width * .1,
                          child: SvgPicture.asset(
                            "assets/images/edit.svg",
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x08000029),
                              offset: Offset(6, 6),
                              blurRadius: 6)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35)))),
            Expanded(
                child: Container(
                    margin: EdgeInsets.fromLTRB(
                        0, 10, 0, MediaQuery.of(context).size.height * 0.12),
                    child: SvgPicture.asset("assets/images/add_files.svg")))
          ],
        ));
  }
}
