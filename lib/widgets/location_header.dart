import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class LocationHeader extends StatelessWidget {
  final Weather? weather;

  const LocationHeader({Key? key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      weather?.areaName ?? "",
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}
