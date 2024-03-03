import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app1/Views/HomeView.dart';
import 'package:weather_app1/cubites/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app1/cubites/get_weather_cubit/get_weather_states.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  condition = condition.toLowerCase();

  if (condition.contains('sunny') ||
      condition.contains('clear') ||
      condition.contains('partly cloudy')) {
    return Colors.orange;
  } else if (condition.contains('cloudy') ||
      condition.contains('overcast') ||
      condition.contains('mist') ||
      condition.contains('fog') ||
      condition.contains('freezing fog')) {
    return Colors.grey;
  } else if (condition.contains('patchy rain') ||
      condition.contains('light drizzle') ||
      condition.contains('light rain') ||
      condition.contains('moderate rain') ||
      condition.contains('heavy rain') ||
      condition.contains('rain shower')) {
    return Colors.lightBlue;
  } else if (condition.contains('thundery outbreaks') ||
      condition.contains('thunder')) {
    return Colors.deepPurple;
  } else if (condition.contains('patchy snow') ||
      condition.contains('blowing snow') ||
      condition.contains('blizzard') ||
      condition.contains('sleet') ||
      condition.contains('ice pellets') ||
      condition.contains('snow shower') ||
      condition.contains('showers of ice pellets') ||
      condition.contains('snow with thunder')) {
    return Colors.lightBlue;
  }

  return Colors.blue;
}
