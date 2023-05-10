import 'package:flutter/material.dart';
import 'package:flutter_wheather/models/wheather_model.dart';
import 'package:flutter_wheather/utilities/date_util.dart';

class CityView extends StatelessWidget {
  const CityView({super.key, required this.snapshot});

  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    var city = snapshot.data?.city?.name;
    var country = snapshot.data?.city?.country;
    var formatedDate =
        DateTime.fromMillisecondsSinceEpoch(snapshot.data?.list?[0].dt ?? 1);

    return Column(children: [
      Text(
        '$city, $country',
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black87),
      ),
      Text(UtilDate.getFornatteDate(formatedDate)),
    ]);
  }
}
