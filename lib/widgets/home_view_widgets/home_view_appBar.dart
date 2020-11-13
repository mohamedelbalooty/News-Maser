import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

Widget homeViewAppBar(){
  return AppBar(
    elevation: 10.0,
    backgroundColor: KWhiteColor,
    automaticallyImplyLeading: false,
    centerTitle: true,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.redAccent, KMainColor],
        ),
      ),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'نيوز',
          style: TextStyle(
            color: KWhiteColor,
            fontSize: 24.0,
          ),
        ),
        Text(
          ' مصر',
          style: TextStyle(
            color: KBlackColor,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}