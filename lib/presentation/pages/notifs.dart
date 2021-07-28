import 'package:flutter/material.dart';

class Notifs extends StatefulWidget {
  Notifs({Key? key}) : super(key: key);

  @override
  _NotifsState createState() => _NotifsState();
}

class _NotifsState extends State<Notifs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Notifs")));
  }
}
