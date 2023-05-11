class WeatherDataCurrent {
  final Current current;
  WeatherDataCurrent({required this.current});

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(current: Current.fromJson(json['current']));
}

class Current {
  int? temp;
  double? feels_like;
  double? uvi;
  int? humidity;
  int? sunrise;
  int? sunset;
  int? clouds;
  double? windSpeed;
  List<Weather>? weather;
}

class Weather {}
