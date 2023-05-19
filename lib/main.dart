import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/repository/weather_repository.dart';
import 'src/repository/http_weather_repository.dart';
import 'src/service/http/dio_http_service.dart';

void main() {
  runApp(
    MyWeatherApp(weatherRepository: HttpWeatherRepository(DioHttpService())),
  );
}

class MyWeatherApp extends StatelessWidget {
  const MyWeatherApp({super.key, required this.weatherRepository});

  final WeatherRepository weatherRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: weatherRepository,
      child: MaterialApp(
        title: 'Weather',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const WeatherAppView(),
      ),
    );
  }
}

class WeatherAppView extends StatelessWidget {
  const WeatherAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
