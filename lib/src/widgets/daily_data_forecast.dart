import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../model/weather_data_daily.dart';
import '../utils/custom_colors.dart';

class DailyDataForecast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;

  const DailyDataForecast({super.key, required this.weatherDataDaily});

  //string manipulation
  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CustomColors.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              'Next Days',
              style: GoogleFonts.inter(
                color: CustomColors.textColorBlack,
                fontSize: 18,
              ),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        getDay(weatherDataDaily.daily[index].dt),
                        style: GoogleFonts.inter(
                          color: CustomColors.textColorBlack,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset(
                        'assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png',
                      ),
                    ),
                    Text(
                      '${weatherDataDaily.daily[index].temp!.max}° / ${weatherDataDaily.daily[index].temp!.min}°',
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: CustomColors.dividerLine,
              ),
            ],
          );
        },
        itemCount: weatherDataDaily.daily.length > 7
            ? 7
            : weatherDataDaily.daily.length,
      ),
    );
  }
}
