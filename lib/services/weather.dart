import 'package:flutter_todo_app/services/location.dart';
import 'package:flutter_todo_app/services/networking.dart';

const apiKey = '7d819c15f8eb6feabcd1b68fd44ad405';
const openWeatherMapURL = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    String url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location
        .getCurrentLocation(); // await just use for Future so update the method
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric'); //remember http:// in RL
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int? condition) {
    if (condition! < 300) {
      return '🌩';
    } else if (condition< 400) {
      return '🌧';
    } else if (condition< 600) {
      return '☔️';
    } else if (condition< 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int? temp) {
    if (temp! > 25) {
      return 'Thời tiết thật dễ chịu 😋';
    } else if (temp > 20) {
      return 'Ngoài trời hơi lạnh đó bạn nhớ mang theo 🧥';
    } else if (temp > 30) {
      return 'Ngoài trời đang nóng lắm nha, mặc 👕 thôi';
    } else {
      return 'Ngoài trời lạnh lắm nha, bạn nhớ 🧥 và đem theo 🧣 với 🧤 nha';
    }
  }
}
