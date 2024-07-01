// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, unused_local_variable, unnecessary_string_interpolations, unnecessary_new, must_be_immutable, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/controll/weather_cubit.dart';
import 'package:weather_app/view/todayweatherScreen.dart/scroolPart/firstWidgetInScroolPart.dart';
import 'package:weather_app/view/todayweatherScreen.dart/scroolPart/formateDateTime.dart';

class ScrollingCard extends StatelessWidget {
  final model;
  ScrollingCard(this.model, WeatherCubit cubit, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        //-----------------------------------feilds-----------------
        var cubit = WeatherCubit.get(context);

        DateTime now = DateTime.now();
        var currentTime =
            new DateTime(now.year, now.month, now.day, now.hour, now.minute);

        int listHourLength = model!.forecast!.forecastday![0].hour!.length;
        var scrollData = model!.forecast!.forecastday![0].hour!;
        //---------------------------------------------------------------

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              listHourLength,
              (index) => Container(
                decoration: BoxDecoration(
                  color:
                      (getDateTime(cubit.weatherData!.location!.localtime!) ==
                              scrollData[index].time!)
                          ? Colors.blue
                          : Colors.grey[700],
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 140,
                width: 80,
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    updateAmPmPart(index),
                    SizedBox(
                      height: 10,
                    ),
                    Image.network(
                      'http:${scrollData[index].condition!.icon!}',
                      height: 60,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${scrollData[index].tempC!}  ْ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
