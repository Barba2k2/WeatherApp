import 'dart:convert';
import 'package:weatherapp_starter_project/src/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp_starter_project/src/model/weather_data_hourly.dart';
import '../model/weather_data_current.dart';
import '../utils/api_url.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  //processing the data from response  -> to json
  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
      WeatherDataCurrent.fromJson(jsonString),
      WeatherDataHourly.fromJson(jsonString),
    );

    return weatherData!;
  }
}
