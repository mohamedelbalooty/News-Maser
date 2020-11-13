import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

checkInternetConnectivity(context, String screen) async {
  _showDialog(title, text) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title, textDirection: TextDirection.rtl,),
          content: Text(text, textDirection: TextDirection.rtl,),
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
    _showDialog('لا يوجد انترنت', "حاول الاتصال بالانترنت");
  } else {
    Navigator.pushReplacementNamed(context, screen);
  }
}
