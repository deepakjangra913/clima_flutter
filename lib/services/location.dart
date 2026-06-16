import 'dart:ffi';

import 'package:geolocator/geolocator.dart';

class Location {

  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission =
      await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

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

      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print("ERROR: $e");
    }
  }
}
