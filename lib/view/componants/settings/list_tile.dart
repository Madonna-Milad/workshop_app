import 'package:flutter/material.dart';

Widget buildListTileItem(String title,VoidCallback onPressed){
return ListTile(
  onTap: onPressed,
minVerticalPadding: 20,
  title: Text(title,style: TextStyle(fontWeight: FontWeight.w600),),
trailing: Icon(Icons.arrow_forward_ios),
);
}