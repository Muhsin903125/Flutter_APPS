import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp3/Screens/Nav_basebar.dart';
import 'package:testapp3/Screens/Screen_Home.dart';
import 'package:testapp3/Screens/Screen_login.dart';

class ScreenSplash extends StatefulWidget {
  ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  late SharedPreferences appData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    CheckSaved();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    CheckSaved();
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Image(
                image: AssetImage("assets/images/logoSplash.png"),
                height: 150,
              )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
                child: Center(
                  child: LinearProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> CheckSaved() async {
    await Future.delayed(Duration(seconds: 5));

    var sharedPfs = await SharedPreferences.getInstance();
    var savedValue = sharedPfs.getString("loginData");

    if (savedValue != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) => Nav_basebar()), (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) => ScreenLogin()), (route) => false);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
