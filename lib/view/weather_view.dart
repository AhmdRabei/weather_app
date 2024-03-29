import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              getWeatherConditionColor(weatherModel.weatherCondition),
              getWeatherConditionColor(weatherModel.weatherCondition)[300]!,
              getWeatherConditionColor(weatherModel.weatherCondition)[50]!,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.cityName,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Uploaded at : ${weatherModel.lastUploaded.hour}:${weatherModel.lastUploaded.minute}',
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: 70,
                      width: 70,
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          'https:${weatherModel.weatherImage}',
                        ),
                      ),
                    ),
                    Text(
                      weatherModel.temp.round().toString(),
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'max temp :${weatherModel.maxTemp} ',
                          style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'min temp :${weatherModel.minTemp} ',
                          style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                weatherModel.weatherCondition!,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
