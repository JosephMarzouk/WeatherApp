import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app1/models/weather_model.dart';

class WeatherService {
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'a9c2dd0f397747cc82f12705232610';
  final Dio dio;
  WeatherService(this.dio);
  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=10');

      Map<String, dynamic> jsonData = response.data;

      WeatherModel weatherModel = WeatherModel.fromJson(jsonData);

      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'oops there was an error, try again';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error, try again');
    }
  }
}