import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clima_tag/controller/global_controller.dart';
import 'package:clima_tag/utilities/custom_colors.dart';
import 'package:clima_tag/models/daily_weather_data.dart';
import 'package:intl/intl.dart';

class DailyWeatherWidget extends StatefulWidget {
  const DailyWeatherWidget({Key? key}) : super(key: key);

  @override
  State<DailyWeatherWidget> createState() => _DailyWeatherWidgetState();
}

class _DailyWeatherWidgetState extends State<DailyWeatherWidget> {
  final globalController = Get.put(GlobalController(), permanent: true);
  late WeatherDataDaily weatherDataDaily;

  @override
  void initState() {
    weatherDataDaily = globalController.getWeatherData().weatherDataDaily();
  }

  String getDay(int dt) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    String time = DateFormat('EEE').format(date);
    return time;
  }

  Widget dailyList() {
    return SizedBox(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: weatherDataDaily.daily.length > 7
            ? 7
            : weatherDataDaily.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      getDay(weatherDataDaily.daily[index].dt!),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: Image.asset(
                                'assets/weather/${weatherDataDaily.daily[index].weather![0].icon!}.png'),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                              '${weatherDataDaily.daily[index].weather![0].description!}'),
                        ],
                      ),
                    ),
                    Text(
                        '${weatherDataDaily.daily[index].temp!.min}° / ${weatherDataDaily.daily[index].temp!.max}°'),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CustomColors.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              '7 Days Forecast',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }
}
