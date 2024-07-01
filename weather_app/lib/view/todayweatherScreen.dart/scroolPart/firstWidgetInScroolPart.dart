import 'package:flutter/material.dart';

Widget updateAmPmPart(int index) {
  return Text(
    (index == 0)
        ? 'at 12 pm'
        : (index <= 12)
            ? 'at ${index} Am'
            : 'at ${index % 12} pm',
    style: TextStyle(color: Colors.white),
  );
}
