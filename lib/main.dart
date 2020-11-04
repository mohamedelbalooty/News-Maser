import 'package:flutter/material.dart';
import 'package:newsmaser/view/topHeadlines_view.dart';
import 'view/business_view.dart';
import 'view/entertainment_view.dart';
import 'view/health_view.dart';
import 'view/home_view.dart';
import 'view/science_view.dart';
import 'view/sports_view.dart';
import 'view/tech_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'نيوز مصر',
      theme: ThemeData(
        fontFamily: 'Tajawal',
      ),
      initialRoute: HomeView.id,
      routes: {
        HomeView.id: (context) => HomeView(),
        TopHeadlinesView.id: (context) => TopHeadlinesView(),
        BusinessView.id: (context) => BusinessView(),
        EntertainmentView.id: (context) => EntertainmentView(),
        HealthView.id: (context) => HealthView(),
        ScienceView.id: (context) => ScienceView(),
        SportsView.id: (context) => SportsView(),
        TechView.id: (context) => TechView(),
      },
    );
  }
}
