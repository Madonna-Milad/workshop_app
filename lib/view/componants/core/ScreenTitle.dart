import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/resourses/colors.dart';

Widget buildScreenTitle(){
  return  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Orange',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: defaultColor),
                ),
                Text(
                  ' Digital Center',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            );
}