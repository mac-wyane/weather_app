import 'package:weather_app/app_consts.dart';
import 'package:weather_app/src/model/current_weather_data_model.dart';
import 'package:weather_app/src/model/forecast_weather_data_model.dart';
import 'package:weather_app/src/repository/weather_repository.dart';
import 'package:weather_app/src/service/http/http_service.dart';

class HttpWeatherRepository extends WeatherRepository {
  HttpWeatherRepository(this.httpService);
  final HttpService httpService;

  @override
  Future<CurrentWeatherDataModel> getCurrentWeather(
      {required String endPoint, required String? city}) async {
    final response = await httpService
        .get(endPoint, queryParameters: {'q': city, 'apikey': API_KEY});
    return CurrentWeatherDataModel.fromJson(response);
  }

  @override
  Future<ForecastWeatherDataModel> getForecastWeather(String? city) {
    // TODO: implement getForecastWeather
    throw UnimplementedError();
  }
}
