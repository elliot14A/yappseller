import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yappadmin/presentation/constants/color_constants.dart';
import 'package:yappadmin/presentation/widgets/counter.dart';
import 'package:yappadmin/presentation/widgets/stackbutton.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
              height: 230,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 6,
                    offset: Offset(6, 6),
                    color: Color(0x09000099)),
                BoxShadow(
                    blurRadius: 6,
                    offset: Offset(6, 6),
                    color: Color(0x09000099))
              ], borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Stack(
                  alignment: Alignment.bottomCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Expanded(
                              child: Row(children: [
                            Expanded(child: _ItemContents()),
                            _ItemImage(context)
                          ]))
                        ],
                      ),
                    ),
                    UpdateButton(context, "Update")
                  ]));
        });
  }

  // ignore: non_constant_identifier_names
  Container _ItemImage(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * .40,
        margin: EdgeInsets.fromLTRB(10, 12, 10, 40),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 8,
                  offset: Offset(12, 12),
                  color: Color(0x09000099)),
              BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 8,
                  offset: Offset(-12, -12),
                  color: Color(0x09000099))
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
        child: Container(
          child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Center(
                  child: Image(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/images/pulses.jfif")),
                ),
                const _EditButton(),
                const _CloseButton()
              ]),
        ));
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 4,
        right: 0,
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 8,
                offset: Offset(12, 12),
                color: Color(0x0f000099)),
            BoxShadow(
                blurRadius: 20,
                spreadRadius: 8,
                offset: Offset(-12, -12),
                color: Color(0x0f000099))
          ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Padding(
              padding: const EdgeInsets.all(0.0), child: Icon(Icons.close)),
        ));
  }
}

class _EditButton extends StatelessWidget {
  const _EditButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: -20,
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: kAccentColor, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SvgPicture.asset(
              "assets/images/edit.svg",
              fit: BoxFit.fitWidth,
              color: Colors.white,
            ),
          ),
        ));
  }
}

class _ItemContents extends StatelessWidget {
  const _ItemContents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 12, 0, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text("Rice Generic",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "Rs.",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Colors.black)),
                            TextSpan(
                                text: "100",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: kAccentColor)),
                            TextSpan(
                                text: "|1Kg",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Colors.black)),
                          ])),
                        ),
                      ),
                      Expanded(
                          child: RichText(
                              text: TextSpan(children: [
                        TextSpan(
                            text: "Stock.",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black)),
                        TextSpan(
                            text: " 2000",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: kAccentColor)),
                      ])))
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Counter(
                        height: 40,
                        width: 85,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Counter(
                        height: 40,
                        width: 85,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
