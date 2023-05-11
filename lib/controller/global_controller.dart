import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima_tag/api/fetch_data.dart';
import 'package:clima_tag/models/weather_data.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _lat = 0.0.obs;
  final RxDouble _lng = 0.0.obs;
  final RxInt cardIndex = 0.obs;
  final weatherData = WeatherData().obs;

  RxBool checkStatus() => _isLoading;
  RxDouble getLat() => _lat;
  RxDouble getLng() => _lng;
  WeatherData getWeatherData() => weatherData.value;
}
