import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app1/cubites/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Search a city',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: TextField(
              onSubmitted: (value)  async{
               var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
               getWeatherCubit.getWeather(cityName: value);
    
               Navigator.pop(context);
               
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 23, horizontal: 15),
                hintText: 'Enter city name',
                suffixIcon: const Icon(Icons.search),
                label: const Text('Search'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.yellowAccent),
                ),
              ),
            ),
          ),
        ));
  }
}
