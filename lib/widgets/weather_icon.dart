import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class WeatherIcon extends StatelessWidget {
  final Weather? weather;

  const WeatherIcon({Key? key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (weather?.weatherIcon == null) {
      return const SizedBox.shrink();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          "https://openweathermap.org/img/wn/${weather!.weatherIcon}@4x.png",
          width: 100,
          height: 100,
        ),
        Text(
          weather?.weatherDescription ?? "",
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ],
    );
  }
}
