import 'dart:convert';
import 'package:clima_tag/models/weather_data.dart';
import 'package:clima_tag/models/current_weather_data.dart';
import 'package:clima_tag/api/api_key.dart';
import 'package:http/http.dart' as http;

class FetchData {
  WeatherData? weatherData;

  Future<WeatherData> getData(lat, lng) async {
    var response = await http.get(Uri.parse(apiUrl(lat, lng)));
    var jsonString = jsonDecode(response.body);

    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString));
    return weatherData!;
  }
}

String apiUrl(lat, lng) {
  String url;
  url = 'https://api.openweathermap.org/data/3.0/onecall?'
      'lat=$lat&'
      'lon=$lng&'
      'exclude=minutely&'
      'appid=$openWeatherApiKey&'
      'units=metric';
  return url;
}
