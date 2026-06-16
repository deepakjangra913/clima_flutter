import 'package:clima_flutter/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print("Latitude: ${location.latitude}");
    print("Longitude: ${location.longitude}");
}

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
