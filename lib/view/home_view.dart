import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsmaser/view/business_view.dart';
import 'package:newsmaser/view/entertainment_view.dart';
import 'package:newsmaser/view/health_view.dart';
import 'package:newsmaser/view/sports_view.dart';
import 'science_view.dart';
import 'tech_view.dart';
import 'package:newsmaser/widgets/home_view_widgets/home_view_appBar.dart';
import 'package:newsmaser/widgets/home_view_widgets/home_view_categoryItem.dart';
import 'package:newsmaser/widgets/home_view_widgets/home_view_topHeadlineCategory.dart';

class HomeView extends StatelessWidget {
  static String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: homeViewAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              homeViewTopHeadlineCategory(context, isPortrait, height, width),
              HomeViewCategoryItem(
                image1: 'sport.png',
                image2: 'health.jpg',
                title1: 'الرياضة',
                title2: 'الصحة',
                screen1: SportsView.id,
                screen2: HealthView.id,
              ),
              HomeViewCategoryItem(
                image1: 'tech.jpg',
                image2: 'business.jpg',
                title1: 'التكنولوجيا',
                title2: 'الأعمال',
                screen1: TechView.id,
                screen2: BusinessView.id,
              ),
              HomeViewCategoryItem(
                image1: 'science.png',
                image2: 'entertainment.jpeg',
                title1: 'العلوم',
                title2: 'الترفيه',
                screen1: ScienceView.id,
                screen2: EntertainmentView.id,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
