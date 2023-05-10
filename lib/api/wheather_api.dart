import 'dart:convert';
import 'dart:developer';
import 'package:flutter_wheather/utilities/location.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_wheather/models/wheather_model.dart';
import 'package:flutter_wheather/utilities/constants.dart';

class WheatherApi {
  Future<WeatherForecast> fetchWheather(
      {String? cityName, bool? isCity}) async {
    Location location = Location();
    await location.getLocation();

    Map<String, String?> parameters;

    if (isCity == true) {
      var queryParameters = {
        'APPID': Constants.weatherApId,
        'units': 'metric',
        'q': cityName,
      };
      parameters = queryParameters;
    } else {
      var queryParameters = {
        'APPID': Constants.weatherApId,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      };
      parameters = queryParameters;
    }

    var url = Uri.https(
        Constants.weatherUrlDomain, Constants.weatherPath, parameters);

    log('request: ${url.toString()}');

    var response = await http.get(url);

    // print(response.body);

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
