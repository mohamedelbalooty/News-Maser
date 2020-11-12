import 'package:flutter/cupertino.dart';

Widget imageWidgetError(){
  return Image.asset(
    'assets/images/photos/emptyPhoto.png',
    fit: BoxFit.fill,
  );
}

Widget imageLoading(){
  return Center(
    child: Image.asset(
      'assets/images/photos/fadeImage.gif',
      height: 50.0,
      width: 50.0,
    ),
  );
}