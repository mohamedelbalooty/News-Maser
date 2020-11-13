import 'package:flutter/material.dart';
import 'package:newsmaser/constants.dart';
import 'package:newsmaser/provider/modal_hud.dart';
import 'package:provider/provider.dart';
import 'view/splash_view.dart';
import 'view/topHeadlines_view.dart';
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
    return ChangeNotifierProvider(
      create: (context) => ModalHud(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'نيوز مصر',
        theme: ThemeData(
          primaryColor: KMainColor,
          primarySwatch: Colors.pink,
          fontFamily: 'Tajawal',
        ),
        initialRoute: SplashView.id,
        routes: {
          SplashView.id: (context) => SplashView(),
          HomeView.id: (context) => HomeView(),
          TopHeadlinesView.id: (context) => TopHeadlinesView(),
          BusinessView.id: (context) => BusinessView(),
          EntertainmentView.id: (context) => EntertainmentView(),
          HealthView.id: (context) => HealthView(),
          ScienceView.id: (context) => ScienceView(),
          SportsView.id: (context) => SportsView(),
          TechView.id: (context) => TechView(),
        },
      ),
    );
  }
}
