import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app1/cubites/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app1/models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key, required this.weather});


final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel? weathermodel =BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return  Padding(
     padding: const EdgeInsets.symmetric(horizontal: 16),
     child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(weathermodel!.cityName,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
         Text('updated at ${stringToDateTime(weathermodel.date.toString()).minute}',style: const TextStyle(fontSize: 17),),
        const SizedBox(height: 32,
        ),
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/clear.png'
          ),
          Text(weathermodel.temp.toString(),
          style: const TextStyle(fontSize: 32),
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('MaxTemp${weathermodel.maxTemp.round()}',
              style: const TextStyle(fontSize: 10),
              ),
              Text('MinTemp${weathermodel.minTemp.round()}',
              style:const TextStyle(fontSize: 10),)
            ],
          )
        ],
       )
        ],
        )
    );
  }
}

DateTime stringToDateTime(String value)
{

  return DateTime.parse(value);
}