import 'package:flutter/material.dart';
import 'package:newsmaser/constants.dart';
import 'package:newsmaser/services/connectivity_service.dart';
import 'package:newsmaser/view/home_view.dart';
import 'package:shimmer/shimmer.dart';

class SplashView extends StatelessWidget {
  static String id = 'SplashView';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/images/photos/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          color: Colors.black26,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: isPortrait ? height * 0.35 : height * 0.2,
              ),
              Shimmer.fromColors(
                period: Duration(milliseconds: 1500),
                baseColor: Colors.white,
                highlightColor: Colors.pink,
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "نيوز مصر",
                    style: TextStyle(
                      fontSize: 50.0,
                      shadows: <Shadow>[
                        Shadow(
                          blurRadius: 18.0,
                          color: Colors.black87,
                          offset: Offset.fromDirection(50, 5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: isPortrait ? height * 0.3 : height * 0.2,
              ),
              _getStartedButton(context, width),
            ],
          ),
        ),
      ),
    );
  }
  Widget _getStartedButton(BuildContext context, double width){
    return InkWell(
      onTap: () async {
        checkInternetConnectivity(context, HomeView.id);
      },
      child: Container(
        height: 50.0,
        width: width * 0.5,
        decoration: BoxDecoration(
          color: KWhiteColor,
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(
            color: KMainColor,
            width: 2.5,
          ),
        ),
        child: Center(
          child: Text(
            'أبدأ',
            style: TextStyle(
              color: KMainColor,
              fontSize: 24.0,
              height: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
