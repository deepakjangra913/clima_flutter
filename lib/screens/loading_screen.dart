import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> getLocation() async {
    try {
      print("Step 1");

      bool serviceEnabled =
      await Geolocator.isLocationServiceEnabled();

      print("Service Enabled: $serviceEnabled");

      LocationPermission permission =
      await Geolocator.checkPermission();

      print("Permission: $permission");

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        print("After Request: $permission");

        if (permission == LocationPermission.denied) {
          print("Permission denied");
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        print("Permission denied forever");
        return;
      }

      Position position =
      await Geolocator.getCurrentPosition();
    } catch (e) {
      print("ERROR: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getLocation();
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
