import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../model/weather_data_current.dart';
import '../utils/custom_colors.dart';

class ConfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const ConfortLevel({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 1, 20, 20),
          child: Text(
            'Confort Level',
            style: GoogleFonts.inter(
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                      handlerSize: 0,
                      trackWidth: 12,
                      progressBarWidth: 12,
                    ),
                    infoProperties: InfoProperties(
                      bottomLabelText: 'Humidity',
                      bottomLabelStyle: GoogleFonts.inter(
                        letterSpacing: 0.1,
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                    animationEnabled: true,
                    size: 140,
                    customColors: CustomSliderColors(
                      hideShadow: true,
                      trackColor:
                          CustomColors.firstGradientColor.withAlpha(100),
                      progressBarColors: [
                        CustomColors.firstGradientColor,
                        CustomColors.secondGradientColor,
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Feels Like: ',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: '${weatherDataCurrent.current.feelsLike}',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 25,
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    width: 1,
                    color: CustomColors.dividerLine,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'UV Index: ',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: '${weatherDataCurrent.current.uvIndex}',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
