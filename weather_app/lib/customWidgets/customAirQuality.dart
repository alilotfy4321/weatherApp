// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomAirQuality extends StatelessWidget {
  final model;
  const CustomAirQuality(this.model);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            CircularPercentIndicator(
              radius: 35.0,
              lineWidth: 7.0,
              percent: 0.7,
              center: Text(
                //"${model.forecast!.forecastday![0].day!.airQuality!.co!.round()}%",
                'Air quality',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
              ),
              progressColor: Colors.blue,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              ' 03 (OZone)\n good job mr ali lotfy ',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
