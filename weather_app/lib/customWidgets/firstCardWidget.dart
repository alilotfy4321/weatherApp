// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_string_interpolations, unused_local_variable, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:weather_app/model/firstCardLastRow.dart';
import 'package:weather_app/model/secondForcastModel.dart';

Widget firstScreenCard(
  context,
  RealWeatheerModel model, {
  double bottomLeft = 40,
  double bottomRight = 40,
  double topLeft = 0,
  double topRight = 0,
  double height = 330,
}) {
  List<FirstCardLastRowModel> firstCardList = [
    FirstCardLastRowModel(
      Icons.wind_power_outlined,
      '${model.current!.windDegree!}',
      'Wind',
    ),
    FirstCardLastRowModel(
      Icons.heat_pump_rounded,
      '${model.current!.humidity!}',
      'Humidity',
    ),
    FirstCardLastRowModel(
      Icons.visibility,
      '${model.current!.visKm!}',
      'Visibility',
    ),
  ];
  return Container(
    width: MediaQuery.of(context).size.width,
    height: height,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 45, 139, 202),
          Color.fromARGB(255, 22, 125, 209),
          Color.fromARGB(255, 94, 24, 224),
        ],
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
        topRight: Radius.circular(topRight),
        topLeft: Radius.circular(topLeft),
      ),
    ),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${model.location!.name!}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${model.current!.tempC!}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              Text(
                ' ْ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                '${model.current!.condition!.text!}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          //icon_url = data["forecast"]["forecastday"][0]["day"]["condition"]["icon"]
          Image.network(
            'http:${model.current!.condition!.icon!}',
            height: 80,
            width: 80,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Icon(
                      firstCardList[index].icon!,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${firstCardList[index].speed!}km/h',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      firstCardList[index].name!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
