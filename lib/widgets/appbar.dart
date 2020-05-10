import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget myAppBar(){
  return AppBar(
    title: Text(
      "Newzity",
      style: TextStyle(
        fontFamily: 'Billabong',
        fontSize: 35.0,
        color: Colors.black
      ),
    ),
    centerTitle: true,
    backgroundColor: Color(0xFFEDF0F6),
    elevation: 0.0,
  );
}