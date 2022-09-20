import 'package:flutter/material.dart';

Widget BuildGridViewItem({
  required double width,
  required double height,
  required IconData columnIcon,
  required text,
  required VoidCallback onPressed,
}) {
  var defaultColor;
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      child: Card(
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Icon(
                columnIcon,
                size: 25,
              ),
              radius: width * .06,
              backgroundColor: Colors.grey[200],
            ),
            SizedBox(
              height: height * .01,
            ),
            Text(
              text,
              style:
                  TextStyle(color: defaultColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}
