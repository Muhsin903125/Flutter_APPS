import 'package:flutter/material.dart';
import 'Screens/Screen_Home.dart';

void main(List<String> args) {
  runApp(Initail());
}

class Initail extends StatelessWidget {
  const Initail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: ScreenHome(),
    );
  }
}
