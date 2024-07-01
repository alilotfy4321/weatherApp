// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, must_be_immutable, prefer_typing_uninitialized_variables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

//----------------------------------------- more usefull to use class to acheive dependency--------------------
class CustomSearchFeild extends StatelessWidget {
  var cubit;
  TextEditingController cityController;
  BuildContext context;

  CustomSearchFeild(this.cubit, this.cityController, this.context);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: cityController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Search City Name',
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              cubit.getHttpWeather(city: cityController.text).then((value) {
                Navigator.pop(context);
              });
            },
            icon: Icon(Icons.search),
          ),
        ),
        // contentPadding: const EdgeInsets.only(
        //     left: 14.0, bottom: 8.0, top: 8.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(25),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            25,
          ),
        ),
      ),
    );
  }
}
