// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_local_variable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/controll/weather_cubit.dart';
import 'package:weather_app/customWidgets/customAirQuality.dart';
import 'package:weather_app/view/next7DayScreen/next7DayWeather.dart';
import 'package:weather_app/view/reprtScreen/reportscreen.dart';
import 'package:weather_app/view/todayweatherScreen.dart/apBar.dart';
import 'package:weather_app/customWidgets/firstCardWidget.dart';
import 'package:weather_app/view/todayweatherScreen.dart/scroolPart/scrollCard.dart';

class TodayScreen extends StatelessWidget {
  TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
      //----------variables----------------------------
      var cubit = WeatherCubit.get(context);
      var model = cubit.weatherData;
      //--------------------------------------------
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: TodayScreenAppBar(context),
        body: (state is WeatherLoadingState)
            ? Center(child: CircularProgressIndicator())
            : (model != null)
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomFirstScreenCard(
                          context,
                          model,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Today',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Next7DayScreen()));
                                },
                                child: Text(
                                  'Next 7 days',
                                ),
                              ),
                            ],
                          ),
                        ),
                        ScrollingCard(model, cubit),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              Text(
                                'AirQuality',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ReportScreen()));
                                },
                                child: Text(
                                  'View Report',
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomAirQuality(model),
                      ],
                    ),
                  )
                : Center(child: CircularProgressIndicator()),
      );
    });
  }
}
