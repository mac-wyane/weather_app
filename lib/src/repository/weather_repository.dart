import 'package:weather_app/src/model/current_weather_data_model.dart';
import 'package:weather_app/src/model/forecast_weather_data_model.dart';

abstract class WeatherRepository {
  Future<CurrentWeatherDataModel> getCurrentWeather(
      {required String endPoint, required String? city});

  Future<ForecastWeatherDataModel> getForecastWeather(String? city);
}
