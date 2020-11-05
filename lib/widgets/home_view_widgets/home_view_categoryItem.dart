import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsmaser/constants.dart';

class HomeViewCategoryItem extends StatelessWidget {
  final String image1;
  final String image2;
  final String title1;
  final String title2;
  final String screen1;
  final String screen2;

  HomeViewCategoryItem(
      {this.image1,
      this.image2,
      this.title1,
      this.title2,
      this.screen1,
      this.screen2});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Row(
      children: [
        _categoryItem(
            context, width, isPortrait, 3.0, 6.0, image1, title1, screen1),
        _categoryItem(
            context, width, isPortrait, 6.0, 3.0, image2, title2, screen2),
      ],
    );
  }

  Widget _categoryItem(
      context,
      double width,
      bool isPortrait,
      double marginLeft,
      double marginRight,
      String image,
      String title,
      String screen) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, screen);
        },
        child: Container(
          height: isPortrait ? width / 2 : width / 4,
          margin: EdgeInsets.only(
              left: marginLeft, right: marginRight, top: 3.0, bottom: 3.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/photos/$image'),
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
                    title,
                    style: TextStyle(
                      color: KWhiteColor,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
