import 'package:flutter/material.dart';
import 'package:flutter_wheather/models/wheather_model.dart';
import 'package:flutter_wheather/utilities/date_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.snapshot});
  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var humidity = forecastList?[0].humidity;
    var wind = forecastList?[0].speed;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UtilDate.getItem(FontAwesomeIcons.cloudRain, humidity!, '%'),
        const SizedBox(
          width: 20,
        ),
        UtilDate.getItem(FontAwesomeIcons.wind, wind!.toInt(), 'm/s')
      ],
    );
  }
}
