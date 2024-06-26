import 'package:clima_weather/environment.dart';
import 'package:clima_weather/services/location.dart';
import 'package:clima_weather/services/networking.dart';

String apiKey = Environment.apiKey;
String weatherURL = Environment.baseURL;

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    String apiURL = '$weatherURL?q=$cityName&appid=$apiKey&units=metric';
    print("${Environment.apiKey}");
    print("${Environment.baseURL}");
    print("$apiKey");
    print("$weatherURL");
    Network networkHelper = Network(apiURL);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    String apiURL =
        '$weatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';

    Network networkHelper = Network(apiURL);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
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

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
