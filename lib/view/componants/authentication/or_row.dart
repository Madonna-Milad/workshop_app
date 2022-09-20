import 'package:flutter/material.dart';

Widget buildSeparatedRow({
  double height=0,
  double width=0,
}){
  return  Row(
              children: [
                Expanded(
                    child: Container(
                  height: 1,
                  color: Colors.grey,
                )),
                 SizedBox(width: width*.015,),

                Text(
                  'OR',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                 SizedBox(width: width*.015,),

                Expanded(
                    child: Container(
                  height: 1,
                  color: Colors.grey,
                )),
              ],
            );
          
}