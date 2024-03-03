import  'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app1/Bodies/NoWeatherBody.dart';
import 'package:weather_app1/Bodies/WeatherInfoBody.dart';
import 'package:weather_app1/Views/searchView.dart';
import 'package:weather_app1/cubites/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app1/cubites/get_weather_cubit/get_weather_states.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:const Text("Weather App",style: TextStyle(color: Colors.white,),),
          backgroundColor: Colors.blue,
          actions: [IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchView(),));
          }, icon: const Icon(Icons.search))],
        ),
        body:BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if(state is WeatherInitialState)
            {
            return  const NoWeatherBody();
            }
            else if(state is WeatherLoadedState)
            { 
               return  WeatherInfo(weather: state.weatherModel);
            }
            else {
              return const Text('oops there was an error');
            }
          },
        ),
      ),
    );
  }
}