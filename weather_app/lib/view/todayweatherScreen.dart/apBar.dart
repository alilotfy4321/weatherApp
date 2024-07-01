// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/view/searchPage/searchPage.dart';

TodayScreenAppBar(context) => AppBar(
      elevation: 0,
      //systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Color.fromARGB(255, 96, 166, 223),
      leading: Icon(
        Icons.menu,
        color: Colors.white,
      ),
      title: Text(
        'Today Weather',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Center(
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
