// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

next7DayAppBar(context) => AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
        color: Colors.white,
      ),
      title: Text(
        'Next 7 days',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
