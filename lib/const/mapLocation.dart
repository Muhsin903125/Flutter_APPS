import 'package:flutter/material.dart';

class MapActivity extends StatefulWidget {
  @override
  _MapActivityState createState() => _MapActivityState();
}

class _MapActivityState extends State<MapActivity> {
  LatLng _center;
  Position currentLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLocation();
  }

  Future<Position> locateUser() async {
    return Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    setState(() {
      _center = LatLng(currentLocation.latitude, currentLocation.longitude);
    });
    print('center $_center');
  }
}
