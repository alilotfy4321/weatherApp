// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:weather_app/view/todayweatherScreen.dart/scroolPart/formateDateTime.dart';

DateTime now = DateTime.now();
var currentTime =
    new DateTime(now.year, now.month, now.day, now.hour, now.minute);

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('report screen'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [
              Color.fromARGB(255, 55, 177, 59),
              Color.fromARGB(255, 35, 103, 80),
              Color.fromARGB(255, 212, 161, 20),
              Color.fromARGB(255, 216, 209, 209),
            ],
          ),
        ),
        child: Center(
            child: Text(
          'Report Screen',
          style: TextStyle(
            fontSize: 25,
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(getDateTime(currentTime));
        },
        child: Text('pres'),
      ),
    );
  }
}
