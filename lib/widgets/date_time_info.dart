import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class DateTimeInfo extends StatelessWidget {
  final Weather? weather;

  const DateTimeInfo({Key? key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (weather?.date == null) {
      return const SizedBox.shrink();
    }
    DateTime utcDate = weather!.date!;
    DateTime localDate = utcDate.toLocal(); // Convert UTC to local

    return Column(
      children: [
        Text(
          DateFormat("h:mm a").format(localDate),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        Text(
          DateFormat("EEEE, MMM d, yyyy").format(localDate),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
