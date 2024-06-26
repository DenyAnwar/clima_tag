class WeatherDataCurrent {
  final Current current;
  WeatherDataCurrent({required this.current});

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(current: Current.fromJson(json['current']));
}

class Current {
  int? temp;
  double? feelsLike;
  double? uvi;
  int? humidity;
  int? sunrise;
  int? sunset;
  int? clouds;
  int? visibility;
  double? windSpeed;
  List<Weather>? weather;

  Current({
    this.temp,
    this.feelsLike,
    this.uvi,
    this.humidity,
    this.sunrise,
    this.sunset,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.weather,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        temp: (json['temp'] as num?)?.round(),
        feelsLike: (json['feels_like'] as num?)?.toDouble(),
        uvi: (json['uvi'] as num?)?.toDouble(),
        humidity: (json['humidity'] as int?),
        sunrise: (json['sunrise'] as int?),
        sunset: (json['sunset'] as int?),
        clouds: (json['clouds'] as int?),
        visibility: (json['visibility'] as int?),
        windSpeed: (json['wind_speed'] as num?)?.toDouble(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: (json['id'] as int?),
        main: (json['main'] as String?),
        description: (json['description'] as String?),
        icon: (json['icon'] as String?),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}
