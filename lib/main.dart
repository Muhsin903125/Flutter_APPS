import 'package:flutter/material.dart';
import 'Screens/Screen_splash.dart';

void main() {
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
      home: ScreenSplash(),
    );
  }
}
