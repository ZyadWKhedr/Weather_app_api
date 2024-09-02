import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class CurrentTemp extends StatelessWidget {
  final Weather? weather;

  const CurrentTemp({Key? key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${weather?.temperature?.celsius?.toStringAsFixed(0)} °C",
      style: const TextStyle(
          fontSize: 36, fontWeight: FontWeight.w500, color: Colors.white),
    );
  }
}
