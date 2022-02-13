import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp3/Screens/Screen_login.dart';
import 'package:testapp3/Screens/Screen_splash.dart';
import 'package:testapp3/Screens/screen_profile.dart';
import 'package:testapp3/const/mycolors.dart';
import 'package:testapp3/const/myStyles.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //final _random = new Random();
    var imagePath =
        'https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?s=612x612';
    DateTime now = DateTime.now();
    return CustomScrollView(
      physics: ClampingScrollPhysics(),
      slivers: <Widget>[
        //  _buildHeader(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          sliver: SliverToBoxAdapter(
            child: null, // StatsGrid(),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 20.0),
          sliver: SliverToBoxAdapter(
            child: null, //CovidBarChart(covidCases: covidUSADailyNewCases),
          ),
        ),
      ],
    );

    // appBar: AppBar(
    //   // leading: Visibility(
    //   //   visible: false,
    //   //   child: Text("a"),
    //   // ),
    //   title: const Text('Home Page'),
    //   actions: [
    //     IconButton(
    //       icon: const Icon(Icons.add_alert),
    //       tooltip: 'Show Snackbar',
    //       onPressed: () {
    //         ScaffoldMessenger.of(context).showSnackBar(
    //             const SnackBar(content: Text('This is a snackbar')));
    //       },
    //     ),
    //     IconButton(
    //         icon: const Icon(Icons.logout),
    //         tooltip: 'Logout',
    //         onPressed: () {
    //           logout(context);
    //         }),
    //   ],
    // ),
    //     // body:
    //     CustomScrollView(
    //   physics: ClampingScrollPhysics(),
    //   slivers: <Widget>[
    //     // _buildHeader(),
    //     ListView.separated(
    //       itemBuilder: (ctx, index) {
    //         return Padding(
    //           padding: const EdgeInsets.symmetric(vertical: 2),
    //           child: ListTile(
    //             // onTap: () => print('pressed $index'),
    //             onTap: () {
    //               Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
    //                 return ScreenProfile(
    //                   name: 'profile $index',
    //                   profImage: imagePath,
    //                 );
    //               }));
    //             },
    //             //onLongPress: () => print(imagePath[2]),
    //             title: Text('Text build ${index}'),
    //             subtitle: Text('Text 2222222 $index'),
    //             leading: CircleAvatar(
    //               // backgroundColor: Colors.green,
    //               radius: 50,
    //               backgroundImage: NetworkImage(imagePath),
    //             ),
    //             trailing: Text(
    //               '${now.hour}:${now.minute}',
    //               style: TextStyle(color: Colors.green.shade800, fontSize: 8),
    //             ),
    //           ),
    //         );
    //       },
    //       separatorBuilder: (ctx, index) => Divider(
    //         height: 10,
    //       ),
    //       itemCount: 3,
    //     ),
    //   ],
    // );
  }

  logout(BuildContext context) async {
    var sharedPfs = await SharedPreferences.getInstance();
    await sharedPfs.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => ScreenLogin()), (Route) => false);
  }
}

SliverPadding _buildHeader1() {
  return SliverPadding(
    padding: const EdgeInsets.all(20.0),
    sliver: SliverToBoxAdapter(
      child: Text(
        'Statistics',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

buildHeader() {
  return Container(
    padding: const EdgeInsets.all(20.0),
    decoration: BoxDecoration(
      //boxShadow: kElevationToShadow,
      image: DecorationImage(
        image: AssetImage("assets/images/BG1.jpg"),
        fit: BoxFit.cover,
      ),
      boxShadow: [
        BoxShadow(
          color: MyColors.shadow,
          offset: const Offset(
            5.0,
            5.0,
          ),
          blurRadius: 10.0,
          spreadRadius: 2.0,
        ), //BoxShadow
      ],
      gradient: LinearGradient(
          colors: [Colors.transparent, Color.fromARGB(255, 176, 172, 212)],
          begin: FractionalOffset(0, 0),
          end: FractionalOffset(0, 1),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40.0),
        bottomRight: Radius.circular(40.0),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 70,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Welcome back !',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 2.0),
                    blurRadius: 20.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
                fontWeight: FontWeight.bold,
              ),
            ),
            // CountryDropdown(
            //   countries: ['CN', 'FR', 'IN', 'IT', 'UK', 'USA'],
            //   country: _country,
            //   onChanged: (val) => setState(() => _country = val),
            // ),
          ],
        ),
        SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Book your favourite seat',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton.icon(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  onPressed: () {},
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  icon: const Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Call Now',
                    style: MyStyles.buttonTextStyle,
                  ),
                  textColor: Colors.white,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  icon: const Icon(
                    Icons.chat_bubble,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  label: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text(
                      'Send SMS',
                      style: MyStyles.buttonTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}

ProfileList() {
  return ListView.separated(
    itemBuilder: (ctx, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: ListTile(
          // onTap: () => print('pressed $index'),
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            //   return ScreenProfile(
            //     name: 'profile $index',
            //     profImage: imagePath,
            //   );
            //}));
          },
          //onLongPress: () => print(imagePath[2]),
          title: Text('Text build ${index}'),
          subtitle: Text('Text 2222222 $index'),
          leading: CircleAvatar(
            // backgroundColor: Colors.green,
            radius: 50,
            // backgroundImage: NetworkImage(imagePath),
          ),
          trailing: Text(
            '1:2pm',
            style: TextStyle(color: Colors.green.shade800, fontSize: 8),
          ),
        ),
      );
    },
    separatorBuilder: (ctx, index) => Divider(
      height: 10,
    ),
    itemCount: 3,
  );
}
