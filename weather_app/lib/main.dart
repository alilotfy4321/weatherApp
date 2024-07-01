// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables, prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/controll/weather_cubit.dart';
import 'package:weather_app/model/firstModel.dart';
import 'package:weather_app/view/todayweatherScreen.dart/todayWeather.dart';

late TodayWeather weatherData;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit()..getHttpWeather(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodayScreen(),
      ),
    );
  }
}
