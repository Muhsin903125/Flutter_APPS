import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp3/Screens/Screen_login.dart';
import 'package:testapp3/Screens/Screen_splash.dart';
import 'package:testapp3/Screens/screen_profile.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //final _random = new Random();
    var imagePath =
        'https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?s=612x612';
    DateTime now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        // leading: Visibility(
        //   visible: false,
        //   child: Text("a"),
        // ),
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
          IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () {
                logout(context);
              }),
        ],
      ),
      body: SafeArea(
        // child: Column(
        //   children: List.generate(
        //     50,
        //     (index) {
        //       return Text('text $index');
        //     },
        //   ),
        // ),

        // child: ListView(
        //   children: List.generate(
        //     150,
        //     (index) {
        //       return Column(
        //         children: [
        //           Text(
        //             'text $index',
        //             style: const TextStyle(
        //               fontSize: 20,
        //               color: Colors.blueAccent,
        //               fontWeight: FontWeight.w800,
        //             ),
        //           ),
        //           Divider(
        //             height: 15,
        //             thickness: 1,
        //           )
        //         ],
        //       );
        //     },
        //   ),
        // ),

        // child: ListView.separated(
        //   itemBuilder: (ctx, index) => Text('Text build $index'),
        //   separatorBuilder: (ctx, index) => Divider(),
        //   itemCount: 70,
        // ),
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: ListTile(
                // onTap: () => print('pressed $index'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return ScreenProfile(
                      name: 'profile $index',
                      profImage: imagePath,
                    );
                  }));
                },
                //onLongPress: () => print(imagePath[2]),
                title: Text('Text build ${index}'),
                subtitle: Text('Text 2222222 $index'),
                leading: CircleAvatar(
                  // backgroundColor: Colors.green,
                  radius: 50,
                  backgroundImage: NetworkImage(imagePath),
                ),
                trailing: Text(
                  '${now.hour}:${now.minute}',
                  style: TextStyle(color: Colors.green.shade800, fontSize: 8),
                ),
              ),
            );
          },
          separatorBuilder: (ctx, index) => Divider(
            height: 10,
          ),
          itemCount: 70,
        ),
      ),
    );
  }

  logout(BuildContext context) async {
    var sharedPfs = await SharedPreferences.getInstance();
    await sharedPfs.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => ScreenLogin()), (Route) => false);
  }
}
