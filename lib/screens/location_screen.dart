import 'package:flutter/material.dart';
import 'package:flutter_wheather/api/wheather_api.dart';
import 'package:flutter_wheather/screens/weather_screen.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  void getLocationData() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      // print('Permissions not given');
      await Geolocator.requestPermission();
    } else {
      try {
        var weatherInfo = await WheatherApi().fetchWheather();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WheatherScreen(
            locationWeather: weatherInfo,
          );
        }));
      } catch (e) {
        print('$e');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.black87,
        ),
      ),
    );
  }
}
