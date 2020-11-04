import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

checkInternetConnectivity(context, String screen) async {
  _showDialog(title, text) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(text),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  ConnectivityResult result = await Connectivity().checkConnectivity();
  if (result == ConnectivityResult.none) {
    _showDialog('No internet', "You're not connected to a network");
  } else {
    Navigator.pushNamed(context, screen);
  }
}
