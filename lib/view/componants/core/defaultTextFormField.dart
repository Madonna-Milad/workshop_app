import 'package:flutter/material.dart';

import '../../../core/resourses/colors.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required String label,
  bool isVisible=false,
  Function onIconPressed=emptyFunction,
  Color fieldColor = Colors.white,
  bool avaliablePrefix = false,
  bool avaliableSuffix=false,
  IconData prefixFieldIcon = Icons.person,
  int maxNumberOfLines = 1,
  bool isNote = false,
}) {
  return TextFormField(
    textAlignVertical: TextAlignVertical.top,
    maxLines: maxNumberOfLines,
    obscureText: isVisible? true : false,
    controller: controller,
    decoration: InputDecoration(
      fillColor: fieldColor,
      label: Text(
        label,
      ),
      border: OutlineInputBorder(
          borderRadius: isNote
              ? BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))
              : BorderRadius.circular(10)),
      suffixIcon: avaliableSuffix
          ? IconButton(
              onPressed: () {
                  onIconPressed();
              },
              icon:isVisible? Icon(
                Icons.visibility_off,
                color: defaultColor,
              ):Icon(
                Icons.visibility,
                color: defaultColor,
              ))
          : null,
      prefixIcon: avaliablePrefix ? Icon(prefixFieldIcon) : null,
    ),
  );
}

void emptyFunction(){}