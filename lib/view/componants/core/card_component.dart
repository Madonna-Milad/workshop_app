import 'package:flutter/material.dart';

Widget buildCardItem(
   String type,String title, String day, String startTime, String endTime) {
  return Container(
    height: 120,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                Spacer(),
                Icon(Icons.timer),
                Text('2hrs'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildCardColumn(
                    title:type ,
                    prefixIcon: Icons.calendar_month,
                    iconColor: Colors.black,
                    dayOrTime: day),
                buildCardColumn(
                    title: 'Start Time',
                    prefixIcon: Icons.access_time_filled,
                    iconColor: Color.fromARGB(255, 130, 233, 134),
                    dayOrTime: startTime),
                buildCardColumn(
                    title: 'End Time',
                    prefixIcon: Icons.access_time_filled,
                    iconColor: Color.fromARGB(255, 241, 155, 184),
                    dayOrTime: endTime),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget buildCardColumn({
  required String title,
  required IconData prefixIcon,
  required Color iconColor,
  required String dayOrTime,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
      Row(
        children: [
          Icon(prefixIcon, color: iconColor),
          Text(dayOrTime, style: TextStyle(fontWeight: FontWeight.w600))
        ],
      )
    ],
  );
}
