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

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    } else {
      getIndex();
    }
    super.onInit();
  }

  RxInt getIndex() => cardIndex;

  getLocation() async {
    bool isEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isEnabled) return Future.error('Service is not enabled');

    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      Future.error('Service denied forever');
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        Future.error('Service denied');
      }
    }

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low)
        .then((value) {
      _lat.value = value.latitude;
      _lng.value = value.longitude;

      return FetchData().getData(_lat.value, _lng.value).then((value) {
        weatherData.value = value;
        _isLoading.value = false;
      });
    });
  }
}
