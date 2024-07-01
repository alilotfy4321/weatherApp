// ignore_for_file: prefer_conditional_assignment, unnecessary_string_interpolations, depend_on_referenced_packages, unnecessary_import, unused_element, unnecessary_null_comparison

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/api/dio_helper.dart';
import 'package:weather_app/constants/secondApi.dart';
import 'package:weather_app/model/secondForcastModel.dart';
import 'package:http/http.dart' as http;

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitialState());

  /// singleton
  static WeatherCubit get(context) => BlocProvider.of(context);

  RealWeatheerModel? weatherData;

  //----------geting weather using dio--------
  void getCurrentWeather() {
    emit(WeatherLoadingState());
    DioHelper.getWeather(
      path: path,
    ).then((value) {
      emit(WeatherSuccesState());

      weatherData = RealWeatheerModel.fromJson(value.data);

      print('data get succusfully..');
    }).catchError((e) {
      emit(WeatherErrorState(e));
      print(e.toString());
    });
    emit(WeatherSuccesState());
  }

  ///////geting weather search data using dio------
  void getSearchCurrentWeather({String? city}) {
    emit(WeatherLoadingState());
    DioHelper.getWeather(path: path, city: city!).then((value) {
      emit(WeatherSuccesState());

      weatherData = RealWeatheerModel.fromJson(value.data);

      print('data get succusfully..');
    }).catchError((e) {
      emit(WeatherErrorState(e));
      print(e.toString());
    });
    emit(WeatherSuccesState());
  }

  //----------------------getHttpWeather-----
  Future<void> getHttpWeather({String city = 'cairo'}) async {
    //emit(WeatherLoadingState());
    var response = await http.get(
      Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=562b53154bd04649867101743241206&q=$city&days=7&aqi=yes',
      ),
    );

    if (response.statusCode == 200) {
      emit(WeatherSuccesState());
      var data = jsonDecode(response.body.toString());

      weatherData = RealWeatheerModel.fromJson(data);
    }
    print(weatherData!.location!.country!);
    emit(WeatherSuccesState());

    if (weatherData! == null) {
      print('model==null...');
    } else {
      print('model hase data...');
    }
//--------------------getTime parse the DateTimeNOw to the datetime in api-----
  }

  //---------------------------------------------------getdateTime-
}
