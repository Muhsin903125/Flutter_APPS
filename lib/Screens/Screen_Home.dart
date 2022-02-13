import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp3/Screens/Screen_login.dart';
import 'package:testapp3/Screens/Screen_splash.dart';
import 'package:testapp3/Screens/screen_profile.dart';
import 'package:testapp3/const/myWidget.dart';
import 'package:testapp3/const/mycolors.dart';
import 'package:testapp3/const/myStyles.dart';
import 'package:testapp3/main.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);
  @override
  final _latestMovies = <Widget>[
    MyWidget.carddMovie("SpiderMan- far away home",
        "assets/images/spiderman.jpg", "9.8", "2021"),
    MyWidget.carddMovie(
        "Ironman 3", "assets/images/ironman.jpg", "6.8", "2012"),
    MyWidget.carddMovie(
        "Avengers", "assets/images/avengers.jpg", "7.3", "2018"),
    MyWidget.carddMovie("Oblivion", "assets/images/oblivion.jpg", null, "2020"),
  ];

  Widget build(BuildContext context) {
    //final _random = new Random();
    DateTime now = DateTime.now();
    return CustomScrollView(
      slivers: <Widget>[
        // const SliverAppBar(
        //   pinned: true,
        //   // snap: true,
        //   // floating: true,
        //   expandedHeight: 100.0,
        //   flexibleSpace: FlexibleSpaceBar(
        //     // title: Text('Demo'),
        //     background: Image(
        //       image: AssetImage("assets/images/BG1.jpg"),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        //   // bottom: Border.symmetric(50),
        //   backgroundColor: Colors.transparent,
        // ),
        SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(
              color: MyColors.white,
            ),
            child: Column(
              children: [
                buildHeader(context),

                // CarouselSlider(
                //   items: _latestMovies,
                //   options: CarouselOptions(
                //     height: 240.0,
                //     enlargeCenterPage: true,
                //     autoPlay: true,
                //     autoPlayCurve: Curves.fastOutSlowIn,
                //     enableInfiniteScroll: true,
                //     autoPlayAnimationDuration: Duration(milliseconds: 800),
                //     viewportFraction: 0.8,
                //   ),
                // ),
              ],
            ),
          ),
        ),
        // MyWidget.mainHeading("Latest Movies", "View All"),
        SliverToBoxAdapter(
          child: MyWidget.mainHeading("Latest Movies", "View All"),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 230.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: .89,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return _latestMovies[index];
            },
            childCount: 4,
          ),
        ),
        SliverToBoxAdapter(
          child: MyWidget.mainHeading("Near Theaters", "View All"),
        ),
        // MyWidget.mainHeading("Upcomings", "View All"),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: ListTile(
              title: Text("Theater $index"),
              subtitle: Text("Location $index"),
              trailing: Text("${index + (2 * index)}km"),
              leading: Icon(
                Icons.location_city,
                size: 35,
              ),
            ),
          );
        }, childCount: 5)),

        // SliverFixedExtentList(
        //   itemExtent: 40.0,
        //   delegate:
        //       SliverChildBuilderDelegate((BuildContext context, int index) {
        //     return Container(
        //       alignment: Alignment.center,
        //       color: Colors.lightBlue[100 * (index % 9)],
        //       child: Text('List Item $index'),
        //     );
        //   }, childCount: 10),
        // ),
      ],
    );
  }

  logout(BuildContext context) async {
    var sharedPfs = await SharedPreferences.getInstance();
    await sharedPfs.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => ScreenLogin()), (Route) => false);
  }
}

buildHeader(BuildContext context) {
  return Stack(children: [
    Container(
      height: 120,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        //boxShadow: kElevationToShadow,
        image: DecorationImage(
          image: AssetImage("assets/images/BG1.jpg"),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
              Colors.white.withOpacity(0.7), BlendMode.dstATop),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: MyColors.shadow,
            offset: const Offset(
              2.0,
              2.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ), //BoxShadow
        ],
        // gradient: LinearGradient(
        //     colors: [Colors.transparent, Color.fromARGB(255, 176, 172, 212)],
        //     begin: FractionalOffset(0, 0),
        //     end: FractionalOffset(0, 1),
        //     stops: [0.0, 1.0],
        //     tileMode: TileMode.clamp),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.my_location, size: 27, color: Colors.white),
                  SizedBox(
                    width: 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        "Kunnakulam, thrissur",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(
                        8.0), //I used some padding without fixed width and height
                    decoration: const BoxDecoration(
                      shape: BoxShape
                          .circle, // You can use like this way or like the below line
                      //borderRadius: new BorderRadius.circular(30.0),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.search,
                      size: 22,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    //I used some padding without fixed width and height
                    decoration: const BoxDecoration(
                      shape: BoxShape
                          .circle, // You can use like this way or like the below line
                      //borderRadius: new BorderRadius.circular(30.0),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.logout,
                      size: 22,
                      color: Colors.black,
                    ),
                  )
                ],
              )
            ],
          ),

          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       'Book your favourite seat',
          //       style: const TextStyle(
          //         color: Colors.white,
          //         fontSize: 20.0,
          //         fontWeight: FontWeight.w600,
          //       ),
          //     ),
          //     SizedBox(height: 10),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: <Widget>[
          //         FlatButton.icon(
          //           padding: const EdgeInsets.symmetric(
          //             vertical: 10.0,
          //             horizontal: 20.0,
          //           ),
          //           onPressed: () {},
          //           color: Colors.red,
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(30.0),
          //           ),
          //           icon: const Icon(
          //             Icons.phone,
          //             color: Colors.white,
          //           ),
          //           label: Text(
          //             'Call Now',
          //             style: MyStyles.buttonTextStyle,
          //           ),
          //           textColor: Colors.white,
          //         ),
          //         ElevatedButton.icon(
          //           onPressed: () {},
          //           style: ButtonStyle(
          //             shape: MaterialStateProperty.all(RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(30.0))),
          //             backgroundColor:
          //                 MaterialStateProperty.all<Color>(Colors.black),
          //           ),
          //           icon: const Icon(
          //             Icons.chat_bubble,
          //             color: Color.fromARGB(255, 255, 255, 255),
          //           ),
          //           label: Padding(
          //             padding: const EdgeInsets.symmetric(
          //                 vertical: 10, horizontal: 20),
          //             child: Text(
          //               'Send SMS',
          //               style: MyStyles.buttonTextStyle,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // )
        ],
      ),
    ),
    Container(
      alignment: Alignment.topCenter,
      padding: new EdgeInsets.only(top: 90, right: 20.0, left: 20.0),
      child: new Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: MyColors.shadow,
              offset: const Offset(
                2.0,
                2.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ), //BoxShadow
          ],
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        height: 45.0,
        width: MediaQuery.of(context).size.width / 1.25,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
                style: TextStyle(fontSize: 15.0),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "search movies..",
                  border: InputBorder.none,
                ))
            //  Row(
            //   children: [
            //     Icon(
            //       Icons.search,
            //       size: 25,
            //       color: Colors.black45,
            //     )
            //   ],
            // ),
            ),
      ),
    )
  ]);
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
