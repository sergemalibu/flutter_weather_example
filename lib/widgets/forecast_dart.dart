import 'package:flutter/material.dart';
import 'package:flutter_wheather/utilities/date_util.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data.list;
  var dayOfWeek = '';
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = UtilDate.getFornatteDate(date);
  dayOfWeek = fullDate.split(',')[0];
  var tempMin = forecastList[index].temp.min.toStringAsFixed(0);
  var icon = forecastList[index].getIconUrl();
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            dayOfWeek,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              '$tempMin °C ',
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          Image.network(
            icon,
            scale: 1.2,
            color: Colors.white,
          )
        ],
      )
    ],
  );
}
