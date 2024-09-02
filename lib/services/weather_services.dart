import 'package:weather/weather.dart';
import 'package:weather_app_api/const.dart';

class WeatherService {
  final WeatherFactory _weatherFactory = WeatherFactory(OPENWEATHER_API_KEY);

  Future<Weather?> fetchCurrentWeather(String city) async {
    try {
      return await _weatherFactory.currentWeatherByCityName(city);
    } catch (e) {
      print('Error fetching weather: $e');
      return null;
    }
  }
}
