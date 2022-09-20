import 'package:flutter/material.dart';

Widget buildListTileItem(String title,VoidCallback onPressed){
return ListTile(
  title: Text(title,style: TextStyle(fontWeight: FontWeight.w600),),
  trailing: IconButton(icon: Icon(Icons.arrow_forward_ios),iconSize: 20,
  onPressed: onPressed),
);
}