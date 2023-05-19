enum WeatherStatus { initial, loading, success, failure }

class WeatherState {
  final WeatherStatus status;

  WeatherState({this.status = WeatherStatus.initial});

  WeatherState copyWith({WeatherStatus? status}) {
    return WeatherState(status: status ?? this.status);
  }
}

extension WeatherStatusEx on WeatherStatus {
  bool get isInitial => this == WeatherStatus.initial;
  bool get isLoading => this == WeatherStatus.loading;
  bool get isSuccess => this == WeatherStatus.success;
  bool get isFailure => this == WeatherStatus.failure;
}
