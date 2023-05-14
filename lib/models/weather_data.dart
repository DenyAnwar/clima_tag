import 'package:clima_tag/models/current_weather_data.dart';
import 'package:clima_tag/models/hourly_weather_data.dart';

class WeatherData {
  WeatherDataCurrent? current;
  WeatherDataHourly? hourly;

  WeatherData([this.current, this.hourly]);

  WeatherDataCurrent weatherDataCurrent() => current!;
  WeatherDataHourly weatherDataHourly() => hourly!;
}
