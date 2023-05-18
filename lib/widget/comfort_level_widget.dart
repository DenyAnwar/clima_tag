import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clima_tag/controller/global_controller.dart';
import 'package:clima_tag/models/current_weather_data.dart';
import 'package:clima_tag/utilities/custom_colors.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ComfortLevelWidget extends StatefulWidget {
  const ComfortLevelWidget({Key? key}) : super(key: key);

  @override
  State<ComfortLevelWidget> createState() => _ComfortLevelWidgetState();
}

class _ComfortLevelWidgetState extends State<ComfortLevelWidget> {
  final globalController = Get.put(GlobalController(), permanent: true);
  late WeatherDataCurrent weatherDataCurrent;

  @override
  void initState() {
    weatherDataCurrent = globalController.getWeatherData().weatherDataCurrent();
  }

  String getKm(int distance) {
    // DateTime date = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    // String time = DateFormat('EEE').format(date);
    int kmDistance = (distance ~/ 1000);
    String kmDistanceString = kmDistance.toString();
    return kmDistanceString;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Comfort Level',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SleekCircularSlider(
          min: 0,
          max: 100,
          initialValue: weatherDataCurrent.current.humidity!.toDouble(),
          appearance: CircularSliderAppearance(
            customColors: CustomSliderColors(
              trackColor: CustomColors.cardColor,
              progressBarColors: [
                CustomColors.thirdGradientColor,
                CustomColors.secondGradientColor,
                CustomColors.firstGradientColor,
              ],
            ),
            customWidths: CustomSliderWidths(
              trackWidth: 12,
              progressBarWidth: 12,
            ),
            infoProperties: InfoProperties(
              bottomLabelText: 'Humidity',
              bottomLabelStyle: const TextStyle(
                fontSize: 14,
              ),
            ),
            animationEnabled: true,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Visibility ${getKm(weatherDataCurrent.current.visibility!)} KM',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'UV Index ${weatherDataCurrent.current.uvi}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
