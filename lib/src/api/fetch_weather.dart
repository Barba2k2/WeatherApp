import 'dart:convert';

import 'package:weatherapp_starter_project/src/model/weather_data.dart';
import 'package:http/http.dart' as http;
import '../model/weather_data_current.dart';
import 'api_key.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  //processing the data from response  -> to json
  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString));

    return weatherData!;
  }
}

String apiURL(var lat, var lon) {
  String url;
  url =
      'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric&exclude=minutely';
  return url;
}
