import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clima_tag/controller/global_controller.dart';
import 'package:clima_tag/utilities/custom_colors.dart';
import 'package:clima_tag/models/hourly_weather_data.dart';
import 'package:intl/intl.dart';

class HourlyWeatherWidget extends StatefulWidget {
  const HourlyWeatherWidget({Key? key}) : super(key: key);

  @override
  State<HourlyWeatherWidget> createState() => _HourlyWeatherWidgetState();
}

class _HourlyWeatherWidgetState extends State<HourlyWeatherWidget> {
  RxInt cardIndex = GlobalController().getIndex();

  final globalController = Get.put(GlobalController(), permanent: true);
  late WeatherDataHourly weatherDataHourly;

  @override
  void initState() {
    weatherDataHourly = globalController.getWeatherData().weatherDataHourly();
    super.initState();
  }

  Widget hourlyList() {
    // print('weather data: ${weatherDataHourly.hourly}');
    // print('hourly length: ${weatherDataHourly.hourly.length}');

    return Container(
      height: 200,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.hourly.length > 12
            ? 12
            : weatherDataHourly.hourly.length,
        itemBuilder: (context, index) {
          return Obx(() => GestureDetector(
                onTap: () {
                  cardIndex.value = index;
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 80,
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0.5, 0),
                        blurRadius: 30,
                        spreadRadius: 1,
                        color: CustomColors.dividerLine.withAlpha(150),
                      ),
                    ],
                    gradient: cardIndex.value == index
                        ? const LinearGradient(colors: [
                            CustomColors.firstGradientColor,
                            CustomColors.secondGradientColor,
                          ])
                        : null,
                  ),
                  child: HourlyDetails(
                      index: index,
                      cardIndex: cardIndex.value,
                      temp: weatherDataHourly.hourly[index].temp!,
                      timeStamp: weatherDataHourly.hourly[index].dt!,
                      icon: weatherDataHourly.hourly[index].weather![0].icon!,
                      desc: weatherDataHourly
                          .hourly[index].weather![0].description!),
                ),
              ));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          child: const Text(
            'Today',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        hourlyList(),
      ],
    );
  }
}

class HourlyDetails extends StatelessWidget {
  final int index;
  final int cardIndex;
  final int temp;
  final int timeStamp;
  final String icon;
  final String desc;

  const HourlyDetails({
    required this.index,
    required this.cardIndex,
    required this.temp,
    required this.timeStamp,
    required this.icon,
    required this.desc,
  });

  String getTime(int dt) {
    DateTime dd = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    String time = DateFormat('jm').format(dd);
    return time;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            getTime(timeStamp),
            style: index == cardIndex
                ? const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)
                : null,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: Image.asset(
            'assets/weather/$icon.png',
            height: 40,
            width: 40,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text('$desc',
              textAlign: TextAlign.center,
              style: index == cardIndex
                  ? const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14.0)
                  : null),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            '$temp°',
            style: index == cardIndex
                ? const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )
                : const TextStyle(fontSize: 17.0),
          ),
        ),
      ],
    );
  }
}
