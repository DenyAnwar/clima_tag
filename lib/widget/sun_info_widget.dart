import 'package:clima_tag/controller/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clima_tag/models/current_weather_data.dart';
import 'package:intl/intl.dart';

class SunInfoWidget extends StatefulWidget {
  const SunInfoWidget({Key? key}) : super(key: key);

  @override
  State<SunInfoWidget> createState() => _SunInfoWidgetState();
}

class _SunInfoWidgetState extends State<SunInfoWidget> {
  final globalController = Get.put(GlobalController(), permanent: true);
  late WeatherDataCurrent weatherDataCurrent;

  String getTime(int x) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(x * 1000);
    String time = DateFormat('jm').format(date);
    return time;
  }

  @override
  void initState() {
    weatherDataCurrent = globalController.getWeatherData().weatherDataCurrent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/icons/sunrise.png',
          height: 80,
        ),
        Container(
          alignment: Alignment.center,
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sunrise',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                getTime(weatherDataCurrent.current.sunrise!),
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 30,
        ),
        Image.asset(
          'assets/icons/sunset.png',
          height: 80,
        ),
        Container(
          alignment: Alignment.center,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sunset',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                getTime(weatherDataCurrent.current.sunset!),
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
