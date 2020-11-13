import 'package:flutter/material.dart';
import 'package:newsmaser/view/topHeadlines_view.dart';
import '../../constants.dart';

Widget homeViewTopHeadlineCategory(
    context, bool isPortrait, double height, double width) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, TopHeadlinesView.id);
    },
    child: Container(
      height: isPortrait ? height * 0.25 : width / 4,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/images/photos/headlines.jpg'),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: KBlackColor,
          width: 1.5,
        ),
      ),
      child: Container(
        color: Colors.black26.withOpacity(0.2),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'أحدث الاخبار',
                style: TextStyle(
                  color: KWhiteColor,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
