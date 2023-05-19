import 'package:flutter/material.dart';
import 'package:weather_app/src/bloc/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/repository/weather_repository.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherRepository) : super(WeatherState());

  final WeatherRepository weatherRepository;

  Future<void> fetchCurrentWeather(
      {required String endPoint, required String? city}) async {
    emit(state.copyWith(status: WeatherStatus.loading));

    try {
      final weather = await weatherRepository.getCurrentWeather(
          endPoint: endPoint, city: city);

      debugPrint("Weather :: $weather");

      emit(state.copyWith(status: WeatherStatus.success));
    } on Exception {
      emit(state.copyWith(status: WeatherStatus.failure));
    }
  }
}
