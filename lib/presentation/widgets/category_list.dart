import 'package:flutter/material.dart';
import 'package:yappadmin/presentation/constants/color_constants.dart';

class CategoryList extends StatefulWidget {
  CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List categories = ["Recent", "General", "Pulses"];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      color: Colors.transparent,
      child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selected = index;
                });
              },
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x08000029),
                            offset: Offset(6, 6),
                            blurRadius: 6),
                        BoxShadow(
                            color: Color(0x08000029),
                            offset: Offset(6, 6),
                            blurRadius: 6),
                      ],
                      borderRadius: BorderRadius.circular(35),
                      color: selected == index ? kAccentColor : Colors.white),
                  child: Center(
                      child: Text(categories[index],
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: index == selected
                                  ? Colors.white
                                  : Colors.black)))),
            );
          }),
    );
  }
}
