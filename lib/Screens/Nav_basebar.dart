import 'package:flutter/material.dart';
import 'package:testapp3/Screens/Screen_Home.dart';
import 'package:testapp3/Screens/Screen_accounts.dart';
import 'package:testapp3/Screens/Screen_search.dart';
import 'package:testapp3/googleRes/mapLocation.dart';
import 'package:testapp3/main2.dart';

class Nav_basebar extends StatefulWidget {
  const Nav_basebar({Key? key}) : super(key: key);

  @override
  _Nav_basebarState createState() => _Nav_basebarState();
}

class _Nav_basebarState extends State<Nav_basebar> {
  int _currentIndex = 0;
  final _pages = [HomeScreen(), ScreenSearch(), ScreenAccount()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}
