import 'package:flutter/material.dart';
import 'package:flutter_wheather/models/wheather_model.dart';

class TempView extends StatelessWidget {
  const TempView({super.key, required this.snapshot});
  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    var wheatherList = snapshot.data?.list;
    var icon = wheatherList?[0].getIconUrl();

    var temp = wheatherList?[0].temp?.day?.toStringAsFixed(0);
    var description = wheatherList?[0].weather?[0].description;

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.network(
        icon!,
        color: Colors.black87,
        scale: 0.5,
      ),
      const SizedBox(
        width: 20,
      ),
      Column(
        children: [
          Text(
            '$temp °C',
            style: const TextStyle(fontSize: 50, color: Colors.black87),
          ),
          Text(
            '$description',
            style: const TextStyle(fontSize: 18, color: Colors.black87),
          )
        ],
      )
    ]);
  }
}
