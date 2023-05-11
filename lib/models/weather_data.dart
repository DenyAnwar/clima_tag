import 'package:clima_tag/models/current_weather_data.dart';

class WeatherData {
  WeatherDataCurrent? current;
  WeatherData([this.current]);

  WeatherDataCurrent weatherDataCurrent() => current!;
}
