import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsmaser/constants.dart';

Widget loading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget connectionError() {
  return _errorMessage('Check your connection');
}

Widget snapshotError() {
  return _errorMessage('Something went wrong');
}

Widget dataError() {
  return _errorMessage('No data available');
}

Widget noDataError() {
  return _errorMessage('No data available now');
}

Widget _errorMessage(String message) {
  return Center(
    child: Container(
      height: 60.0,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: KMainColor,
          width: 1.5,
        ),
      ),
      child: Text(
        message,
        style: TextStyle(
          color: KBlackColor,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
