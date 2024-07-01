// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, use_key_in_widget_constructors, must_be_immutable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/controll/weather_cubit.dart';
import 'package:weather_app/customWidgets/customSearchFeild.dart';
import 'package:weather_app/customWidgets/firstCardWidget.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
      //-----------cubit Data fields---------------------------

      var cubit = WeatherCubit.get(context);
      var currentData = cubit.weatherData!;
      //---------------------------------------------------------

      return Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: Text(
            'Search City Name',
          ),
          centerTitle: true,
        ),
        body: (currentData != null)
            ? Padding(
                padding: const EdgeInsets.all(30.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomSearchFeild(cubit, cityController, context),
                      SizedBox(
                        height: 30.0,
                      ),
                      (state is WeatherLoadingState)
                          ? Center(child: CircularProgressIndicator())
                          : (currentData != null)
                              ? CustomFirstScreenCard(context, currentData,
                                  topLeft: 40, topRight: 40, height: 500)
                              : SizedBox(),
                    ],
                  ),
                ),
              )
            : SizedBox(),
      );
    });
  }
}
