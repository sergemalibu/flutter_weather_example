import 'package:flutter/material.dart';
import 'package:flutter_wheather/api/wheather_api.dart';
import 'package:flutter_wheather/screens/city_screen.dart';
import 'package:flutter_wheather/widgets/bottom_list_view.dart';
import 'package:flutter_wheather/widgets/city_view.dart';
import 'package:flutter_wheather/widgets/detail_view.dart';
import 'package:flutter_wheather/widgets/temp_view.dart';

import '../models/wheather_model.dart';

class WheatherScreen extends StatefulWidget {
  const WheatherScreen({
    super.key,
    this.locationWeather,
  });
  final locationWeather;
  @override
  State<WheatherScreen> createState() => _WheatherScreenState();
}

class _WheatherScreenState extends State<WheatherScreen> {
  Future<WeatherForecast>? wheatherObject;
  String? _cytiName;
  // String? _cytiName = 'Vladivostok';
  @override
  void initState() {
    super.initState();
    if (widget.locationWeather != null) {
      wheatherObject = Future.value(widget.locationWeather);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              wheatherObject = WheatherApi().fetchWheather();
            });
          },
        ),
        backgroundColor: Colors.black87,
        title: const Text('OpenwatherMap'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                var tappedName = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CityScreen()));
                if (tappedName != null) {
                  _cytiName = tappedName;
                  wheatherObject = WheatherApi()
                      .fetchWheather(cityName: _cytiName, isCity: true);
                  setState(() {});
                }
              },
              icon: const Icon(Icons.location_city))
        ],
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: wheatherObject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(height: 20),
                    CityView(snapshot: snapshot),
                    TempView(snapshot: snapshot),
                    const SizedBox(height: 20),
                    DetailView(snapshot: snapshot),
                    const SizedBox(height: 20),
                    BottomListView(snapshot: snapshot),
                  ],
                );
              } else {
                return const Center(
                    child: Text(
                        'City not found\n Please enter correct city') //CircularProgressIndicator(),
                    );
              }
            },
          )
        ],
      ),
    );
  }
}
