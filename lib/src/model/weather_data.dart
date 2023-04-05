import 'package:weatherapp_starter_project/src/model/weather_data_current.dart';

class WeatherData {
  final WeatherDataCurrent? current;

  WeatherData([this.current]);

  //function to fetch these values
  WeatherDataCurrent getCurrentWeather() => current!;
}
