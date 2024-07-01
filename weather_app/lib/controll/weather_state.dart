// ignore_for_file: camel_case_types

part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccesState extends WeatherState {}

class WeatherErrorState extends WeatherState {
  final error;
  WeatherErrorState(this.error);
}

class WeatherDateTimeState extends WeatherState {}
