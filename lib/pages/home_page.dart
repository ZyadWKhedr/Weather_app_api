import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app_api/services/weather_services.dart';
import 'package:weather_app_api/widgets/location_header.dart';
import 'package:weather_app_api/widgets/date_time_info.dart';
import 'package:weather_app_api/widgets/weather_icon.dart';
import 'package:weather_app_api/widgets/current_temp.dart';
import 'package:weather_app_api/widgets/extra_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherService _weatherService = WeatherService();
  Weather? _weather;
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _weatherService.fetchCurrentWeather('London').then((w) {
      setState(() {
        _weather = w;
      });
    });
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
    });
  }

  void _searchWeather() {
    String city = _searchController.text;
    if (city.isNotEmpty) {
      _weatherService.fetchCurrentWeather(city).then((w) {
        setState(() {
          _weather = w;
          _isSearching = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Enter city name',
                  hintStyle: TextStyle(color: Colors.white54),
                ),
                style: const TextStyle(color: Colors.white),
                onSubmitted: (_) => _searchWeather(),
              )
            : const Text(
                'Weather App',
                style: TextStyle(color: Colors.white),
              ),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search,
                color: Colors.white),
            onPressed: _toggleSearch,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 1, 11, 109),
                  Color.fromARGB(255, 163, 0, 192)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: _buildUI(),
          ),
        ),
      ),
    );
  }

  Widget _buildUI() {
    if (_weather == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LocationHeader(weather: _weather),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          DateTimeInfo(weather: _weather),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          WeatherIcon(weather: _weather),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          CurrentTemp(weather: _weather),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          ExtraInfo(weather: _weather),
        ],
      ),
    );
  }
}
