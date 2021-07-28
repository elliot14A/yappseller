import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yappadmin/presentation/constants/color_constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:yappadmin/presentation/widgets/counter.dart';
import 'package:yappadmin/presentation/widgets/stackbutton.dart';

class AddNewItem extends StatefulWidget {
  AddNewItem({Key? key}) : super(key: key);

  @override
  _AddNewItemState createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: Container(
              height: 36,
              width: 36,
              child: SvgPicture.asset(
                "assets/images/arrow-circle-left.svg",
                color: kAccentColor,
                fit: BoxFit.cover,
              ),
            )),
        centerTitle: true,
        title: Text("Add New Item",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black)),
      ),
      body: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            height: MediaQuery.of(context).size.height * .7,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 6,
                      offset: Offset(6, 6),
                      color: Color(0x0f000099)),
                  BoxShadow(
                      blurRadius: 6,
                      offset: Offset(-6, 6),
                      color: Color(0x0f000099))
                ]),
            child: Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Expanded(child: Container()),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kAccentColor,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(text: "\t\t\t\tPrice "),
                                    TextSpan(text: "*\n"),
                                    TextSpan(text: "(in rupees)"),
                                  ]),
                            ),
                            Text("9999",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            Counter(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.25)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .0275,
                      )
                    ],
                  ),
                ),
                UpdateButton(context, "Done")
              ],
            ),
          )),
    );
  }
}
