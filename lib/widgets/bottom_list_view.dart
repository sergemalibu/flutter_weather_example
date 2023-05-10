import 'package:flutter/material.dart';
import 'package:flutter_wheather/models/wheather_model.dart';
import 'package:flutter_wheather/widgets/forecast_dart.dart';

class BottomListView extends StatelessWidget {
  const BottomListView({super.key, required this.snapshot});
  final AsyncSnapshot<WeatherForecast> snapshot;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          '7-DAY WEATHER',
          style: TextStyle(color: Colors.black87, fontSize: 20),
        ),
        Container(
            height: 140,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(
                width: 8,
              ),
              itemCount: snapshot.data!.list!.length,
              itemBuilder: (context, index) => Container(
                width: MediaQuery.of(context).size.width / 2.7,
                height: 160,
                color: Colors.black87,
                child: forecastCard(snapshot, index),
              ),
            )),
      ],
    );
  }
}
