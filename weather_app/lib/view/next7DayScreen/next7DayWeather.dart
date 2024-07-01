// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/controll/weather_cubit.dart';
import 'package:weather_app/view/next7DayScreen/apBar.dart';
import 'package:weather_app/customWidgets/firstCardWidget.dart';

class Next7DayScreen extends StatelessWidget {
  const Next7DayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        //--------------data---------------
        var cubit = WeatherCubit.get(context);
        var model = cubit.weatherData!;
        var forcastDate = model.forecast!.forecastday!;
//---------------------------------------------------------------
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: next7DayAppBar(context),
          body: SingleChildScrollView(
            child: Column(
              children: [
                CustomFirstScreenCard(context, cubit.weatherData!),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        forcastDate.length,
                        (index) => Container(
                          margin: EdgeInsetsDirectional.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${forcastDate[index].date!}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Image.network(
                                  'http:${forcastDate[index].day!.condition!.icon!}',
                                  height: 50,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '${forcastDate[index].day!.condition!.text!}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
