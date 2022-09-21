import 'package:flutter/material.dart';
import 'package:workshop_app/core/resourses/colors.dart';
import 'package:workshop_app/model/university_model.dart';

import '../../../view_model/authentication/signup_cubit.dart';

Widget dropDownColumn(double height, double width, String title,
    List<String>? items, SignUpCubit cubit) {
  return Column(
    children: [
      Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      SizedBox(height: height * .01),
      Container(
        padding: EdgeInsets.all(5),
        height: height * .07,
        decoration: BoxDecoration(
          border: Border.all(color: defaultColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButton(
          
          underline: Text(''),
          value: items!.first,
          alignment: AlignmentDirectional.center,
          items: items.map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            
            cubit.changeDropDownValue(value);
          },
          
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ],
  );
}
