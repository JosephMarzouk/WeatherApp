import 'package:weather_app1/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  WeatherLoadedState(this.weatherModel);

  final WeatherModel weatherModel;
}

class WeatherFaliureState extends WeatherState {}
