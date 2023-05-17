import 'package:clima_tag/models/current_weather_data.dart';
import 'package:clima_tag/models/hourly_weather_data.dart';
import 'package:clima_tag/models/daily_weather_data.dart';

class WeatherData {
  WeatherDataCurrent? current;
  WeatherDataHourly? hourly;
  WeatherDataDaily? daily;

  WeatherData([this.current, this.hourly, this.daily]);

  WeatherDataCurrent weatherDataCurrent() => current!;
  WeatherDataHourly weatherDataHourly() => hourly!;
  WeatherDataDaily weatherDataDaily() => daily!;
}
