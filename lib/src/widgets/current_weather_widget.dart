import 'package:flutter/material.dart';
import '../model/weather_data_current.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //tempearture area

        //more details - windspeed, humidity, temperature
      ],
    );
  }
}
