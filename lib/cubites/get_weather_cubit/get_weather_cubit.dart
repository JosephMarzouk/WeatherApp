import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app1/cubites/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app1/services/weather_services.dart';
import '../../models/weather_model.dart';


class GetWeatherCubit extends Cubit<WeatherState> {
    WeatherModel? weatherModel;
  GetWeatherCubit() : super(WeatherInitialState());
  
  getWeather({required String cityName}) async {
    try {
       final model =
          await WeatherService(Dio()).getWeather(cityName: cityName);
          weatherModel= model;
      emit(WeatherLoadedState(model));
    } catch (e) {
      emit(WeatherFaliureState());
    }
  }
}