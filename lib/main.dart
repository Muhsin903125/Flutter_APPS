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

// void _getdata() async {
//   Map _countries = new Map();

//   var url = "http://country.io/names.json";
//   var res = await http.get(url);

//   if (res.statusCode == 200) {
//     setState() {
//       _countries = JSON.decode(res.body);
//       print("loaded ${_countries.length}");
//     }
//   }
// }
