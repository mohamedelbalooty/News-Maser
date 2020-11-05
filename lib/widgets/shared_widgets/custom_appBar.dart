import 'package:flutter/material.dart';
import '../../constants.dart';

Widget customAppBar(context, String title) {
  return AppBar(
    elevation: 12.0,
    backgroundColor: KWhiteColor,
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
        icon: Icon(
          Icons.arrow_forward,
          size: 26.0,
          color: KWhiteColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.redAccent, KMainColor],
        ),
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        color: KWhiteColor,
        fontSize: 20.0,
      ),
    ),
  );
}
