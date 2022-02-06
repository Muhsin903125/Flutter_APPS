import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp3/Screens/Screen_Home.dart';
import 'package:testapp3/main.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final _textUsername = TextEditingController();

  final _textpassword = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Login Screen",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.green,
                        )),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _textUsername,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter user name",
                        labelText: "Username",
                        icon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username is empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _textpassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Password",
                        labelText: "Password",
                        icon: Icon(Icons.lock),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton.icon(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            SaveLogin(context);
                          }
                        },
                        icon: Icon(Icons.login),
                        label: Text("Login"))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> SaveLogin(BuildContext context) async {
    final _username = _textUsername.text;
    final _password = _textpassword.text;
    if (_username == _password && _textUsername != null) {
      var SharedPfs = await SharedPreferences.getInstance();
      await SharedPfs.setString("loginData", _textUsername.text);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => ScreenHome()),
          (route) => false);
    } else {
      final _errMsg = 'Invalid username/password';

      //snack bar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(_errMsg),
        backgroundColor: Colors.red.shade800,
        duration: Duration(seconds: 10),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
      ));

      //dailog pop
      // showDialog(
      //     context: context,
      //     builder: (ctx1) {
      //       return AlertDialog(
      //         title: Text("failed"),
      //         content: Text(_errMsg),
      //         actions: [
      //           TextButton(
      //             onPressed: () => Navigator.pop(ctx1),
      //             child: Text("Close"),
      //           )
      //         ],
      //       );
      //     });
    }
  }
}
